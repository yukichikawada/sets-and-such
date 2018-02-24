class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList

  attr_reader :first_node, :last_node

  def initialize
    @first_node = Node.new
    @last_node = Node.new
    first_node.next = @last_node
    last_node.prev = @first_node
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @first_node.next
  end

  def last
    @last_node.prev
  end

  def empty?
    first_node.next==last_node
  end

  def get(key)
    return nil if empty?

    node = first

    until node.key == key
      node = node.next
      return nil if node.nil?
    end

    node.val
  end

  def include?(key)
    node = first
    until node.key == key
      node = node.next
      return false if node.nil?
    end
    true
  end

  def append(key, val)
    new_node = Node.new(key,val)
    new_node.next = last_node
    new_node.prev = last
    last.next = new_node
    last_node.prev = new_node
  end

  def update(key, val)
    return nil if empty?

    node = first

    until node.key == key
      node = node.next
      return nil if node.nil?
    end

    node.val = val
  end

  def remove(key)
    node = first
    until node.key == key
      node = node.next
      return nil if node.nil?
    end
    node.prev.next = node.next
    node.next.prev = node.prev
  end

  def each
    res = []
    node = first
    until node.val.nil?
      res.push(node.val)
      # puts node.val
      p res
      node = node.next
    end
    res
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
