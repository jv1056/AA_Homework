class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queu
 def initialize
   @queue = []
 end

  def enqueue(el)
    @queue << el
  end


  def dequeue
    @queue.shift
  end

  def show
    @queue.dup

  end

end



class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    pair_index = @map.index {|pair| pair[0] == key}
    pair_index ? @map[pair_index][1] = value : @map.push([key, value])
    [key, value]
  end

  def lookup(key)
    @map.each {|pair| return pair[1] if pair[0] == key}
  end


  def remove(key)
    @map.reject! {|pair| pair[0] == key}
  end

  def deep_dup(arr)

    arr.map { |pair| i.is_a?(Array) ? deep_dup(el) ? : el}
  end

  def show
    deep_dup(@map)
  end





end
