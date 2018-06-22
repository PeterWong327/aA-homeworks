class Stack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(el)
    stack.push(el)
  end

  def pop
    stack.pop
  end

  def peek
    puts stack[-1]
  end
end
