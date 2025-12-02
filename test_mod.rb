require "./mod"

class TestModule
  include MyFirstModule

  def initialize
    ruby_version
  end
end

tm = TestModule.new

