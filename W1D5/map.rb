class Map
  attr_reader :map

  def initialize
    @map = []
  end

  def set(key, value)
    pair_index = map.index { |pair| pair[0] == key }
    if pair_index
      map[pair_index][1] = value
    else
      map.push([key, value])
    end
    value 
  end

  def get(key)
    map.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def delete(key)
    value = get(key)
    map.reject! { |pair| pair[0] == key }
    value
  end

  def show
    deep_dup(map)
  end

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) } ? deep_dup(el) : el }
  end

end
