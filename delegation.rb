require 'delegate'

class SimpleDelegator < Delegator
  def __getobj__
    @delegate_sd_obj
  end

  def __setobj__(obj)
    @delegate_sd_obj
  end
end

class Print < BasicObject
  def take_name(name)
    ::Kernel.puts "Hello World From Abishek"
  end
end

name = Print.new

KERNEL_RESPOND_TO = ::Kernel.instance_method(:respond_to?)
puts KERNEL_RESPOND_TO.bind_call(name, :take_name)

