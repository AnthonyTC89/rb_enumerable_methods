module Enumerable
    def self.my_each array
        array.length.times do |i|
            yield (array[i])
        end
    end
end

array = [1,2,3,4,5]

array.each do |elem|
    puts elem
end
# 2 4 6 8 10
Enumerable::my_each (array) { |elem| puts elem } 
# 2 4 6 8 10