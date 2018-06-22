class Queue
  attr_accessor :queue

  def initialize
    @queue = []
  end
  def enqueue(el)
    queue.unshift(el)
  end

  def dequeue
    queue.pop
  end

  def peek
    puts queue.first
  end
end
