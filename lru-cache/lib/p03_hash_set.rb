require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include? key
      if count == num_buckets
        resize!
      end
      @store[key.hash % num_buckets] << key
      @count += 1
    end
  end

  def remove(key)
    if include? key
      @store[key.hash % num_buckets].delete(key)
      @count -= 1
    end
  end

  def include?(key)
    @store[key.hash % num_buckets].include? key
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }

    @store.each do |bucket|
      bucket.each do |num|
        new_store[num % (num_buckets * 2)] << num
      end
    end

    @store = new_store
  end
end
