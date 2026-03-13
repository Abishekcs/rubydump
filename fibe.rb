class MyScheduler
  def initialize
    @fibers = []
    @ready = []
  end

  # Required: Fiber.schedule calls this to create + register fibers
  def fiber(&block)
    fiber = Fiber.new(blocking: false, &block)
    @fibers << fiber
    fiber
  end

  def block(blocker, timeout = nil)
    fiber = Fiber.current
    if timeout
      @ready << [fiber, Time.now + timeout]
    end
    Fiber.yield
  end

  def unblock(blocker, fiber)
    @ready << [fiber, Time.now]
  end

  def kernel_sleep(duration = nil)
    block(:sleep, duration)
  end

  def io_wait(io, events, timeout)
    block(:io_wait, timeout)
  end

  def close
    run
  end

  def run
    until @fibers.empty? && @ready.empty?
      while (fiber = @fibers.shift)
        fiber.resume
      end

      now = Time.now
      @ready.select! do |fiber, wake_at|
        if now >= wake_at
          fiber.resume
          false
        else
          true
        end
      end

      sleep(0.01) unless @ready.empty?
    end
  end
end

puts "Go to sleep!"
Fiber.set_scheduler(MyScheduler.new)

Fiber.schedule do
  puts "Going to sleep"
  sleep(1)
  puts "I slept well"
end

puts "Wakey-wakey, sleepyhead"
