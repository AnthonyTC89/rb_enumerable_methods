module Enumerable
    def self.my_each array
        array.length.times do |i|
            yield (array[i])
        end
    end
    def self.my_each_with_index array
        array.length.times do |i|
            yield array[i], i
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

array.each_with_index do |elem,index|
    puts "elem: " + elem.to_s + ", index:" + index.to_s
end

Enumerable::my_each_with_index (array) {|elem, index| puts "elem: " + elem.to_s + ", index:" + index.to_s} 