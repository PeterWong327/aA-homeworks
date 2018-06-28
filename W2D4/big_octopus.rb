#Sluggish Octopus: O(n^2) time
def longest_fish(fishes)
  fishes.each_with_index do |fish1, i1|
    longest = true

    fishes.each_with_index do |fish2, i2|
      next if i1 == i2
      longest = false if fish2.length > fish1.length
    end

    return fish1 if longest
  end

end


#Dominant Octopus: O(n log n) time
class Array

def merge_sort(&prc)
  prc ||= Proc.new { |x, y| x <=> }
  middle = self.length / 2
  return self if self.length <= 1

  left_side = self.take(middle).merge_sort(&prc)
  right_side = self.drop(middle).merge_sort(&prc)

   Array.merge(left_side, right_side, &prc)
end

def merge(left, right, &prc)
  result = []

  until left.empty? || right.empty?
    x = left.first
    y = right.first

    case prc.call(x, y)
    when -1
      result << left.shift
    when 0
      result << left.shift
    when 1
      result << right.shift
    end
  end

  result + left + right
end

def biggest_fish(fishes)
  prc = Proc.new { |x, y| y.length <=> x.length }
  fishes.merge_sort(&prc).first
end

#Clever Octopus: O(n)
def biggest_fiish(fishes)
  biggest = fishes.first

  fishes.each do |fish|
    if fish.length > biggest.length
      biggest = fish
    end
  end

  biggest
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def dancing_octopus(direction, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return index if tile == direction
  end
end

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
