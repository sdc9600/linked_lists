class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end
  
  def append(value)
    if @head == nil
      @head = Node.new(value)
      @tail = Node.new(value)
    else
      tmp = @head
      until tmp.next_node == nil
        tmp = tmp.next_node
      end
        tmp.next_node = Node.new(value)
      @tail = Node.new(value)
    end
  end

  def prepend(value)
    if @tail == nil
      @head = value
      @tail = value
    else
      tmp = @head
      @head = Node.new(value)
      @head.next_node = tmp
    end
  end

  def size
    size = 0
    tmp = @head
    until tmp == nil
      size += 1
      tmp = tmp.next_node
    end
    size
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    tmp = @head
    tmp_index = 0
    until tmp_index == index
      tmp = tmp.next_node
      tmp_index += 1
    end
      tmp
  end

  def pop
    if @head.next_node == nil
      @head = nil
      @tail = nil
    elsif @head.next_node.next_node == nil
      @head.next_node = nil
      @tail = @head
    else
    tmp = @head
      until tmp.next_node.next_node == nil # The penultimate element of the linked list
        tmp = tmp.next_node
      end
    @tail = tmp
    @tail.next_node = nil
    end
    p @head
    p @tail 
  end

  def contains?(value)
    tmp = @head
    until tmp == nil
      return true if tmp.value == value
      tmp = tmp.next_node
    end
    false
  end

  def find(value)
    tmp = @head
    index = 0
    until tmp == nil
      return index if tmp.value == value
      index += 1
      tmp = tmp.next_node
    end
    nil
  end

  def to_s
    tmp = @head
    until tmp == nil
    print "( #{tmp.value} ) -> "
    tmp = tmp.next_node
    end
    print "nil\n"
  end

end

class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end





