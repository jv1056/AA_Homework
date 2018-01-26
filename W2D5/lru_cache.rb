class LRUCache
  attr_accessor :cache
  attr_reader :length
  def initialize(length)
    @length = length
    @cache = []
  end

  def count
  @cache.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache.unshift(el)
    elsif count >= @length
        cache.pop
        cache.unshift(el)
    else
      cache.unshift(el)
    end
  end

  def show
    print @cache
  end

  private
  # helper methods go here!

end
