require "spec"

def list_multiples(array : Array(Int32), limit : Int32)
  multiples = [] of Int32

  array.each { |num|
    factor = 1
    new_num = 1

    while new_num < limit
      new_num = factor * num
      multiples.push(new_num) if new_num < limit
      factor += 1
    end
  }

  multiples.sort.uniq
end

def sum_multiples(array : Array(Int32), limit : Int32)
  list_multiples(array, limit).sum
end

it "should list all numbers below 10 that are multiples of 3 or 5" do
  list_multiples([3, 5], 10).should eq([3, 5, 6, 9])
end

it "should sum all numbers below 10 that are multiples of 3 or 5" do
  sum_multiples([3, 5], 10).should eq(23)
end

it "should find the sum of all the multiples of 3 or 5 below 1000" do
  sum_multiples([3, 5], 1000).should eq(233168)
end
