class List
  class MyNode
    attr_accessor :next
    attr_reader :value

    def initialize(value)
      @next = nil
      @value = value
    end
  end

  def initialize
    @root = nil
  end

  def add value
    if @root.nil?
      @root = MyNode.new(value)
    else
      current_node = @root
      while current_node.next != nil
        current_node = current_node.next
      end
      current_node.next = MyNode.new(value)
    end
  end

  def delete value
    return nil unless @root
    current_node = @root
    prev_node = nil
    while current_node.value != value
      prev_node = current_node
      current_node = current_node.next
      break if current_node.nil?
    end
    prev_node.next = current_node.next unless prev_node.nil?
    return true
  end

  def find value
    return nil unless @root
    current_node = @root
    while current_node.value != value
      current_node = current_node.next
      break if current_node.nil?
    end
    current_node
  end

  def values
    arr = []
    current_node = @root
    while current_node != nil
      arr << current_node.value
      current_node = current_node.next
    end
    return arr
  end
end
