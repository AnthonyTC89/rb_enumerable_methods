module Enumerable
    def self.my_each array
        array.length.times do |i|
            yield array[i]
        end
    end

    def self.my_each_with_index array
        array.length.times do |i|
            yield array[i], i
        end
    end
    
    def self.my_select array
        aux_array = []
        array.length.times do |i|
            if yield array[i]
                aux_array << array[i]
            end
        end
        return aux_array
    end

    def self.my_all? array
        array.length.times do |i|
            if !yield array[i]
                return false
            end
        end
        return true
    end

    def self.my_any? array
        array.length.times do |i|
            if yield array[i]
                return true
            end
        end
        return false
    end

    def self.my_none? array
        array.length.times do |i|
            if yield array[i]
                return false
            end
        end
        return true
    end

    def self.my_count array
        count = 0
        array.length.times do |i|
            if yield array[i]
                count += 1
            end
        end
        return count
    end

    def self.my_map array
        array.length.times do |i|
            array[i] = yield array[i]
        end
        return array
    end

    def self.my_inject array
        memo = array[0]
        (array.length-1).times do |i|
            memo = yield memo, array[i+1]
        end
        return memo
    end
end

def multiply_els array
    return Enumerable::my_inject (array) { |elem, n| elem * n}
end

array = [2,4,5]

p multiply_els (array)
p array.inject { |elem, n| elem * n}

# p Enumerable::my_inject (array) { |elem, n| elem + n}
# p array.inject { |elem, n| elem + n}

# p Enumerable::my_map (array) {|elem| elem + 2}
# p array.map { |elem| elem + 2}

# p Enumerable::my_count (array) {|elem| elem > 2}
# p array.count { |elem| elem > 2}

# p Enumerable::my_none? (array) {|elem| elem == 7}
# p array.none? {|elem| elem == 7}

# p Enumerable::my_any? (array) { |elem| elem == 4 }
# p array.any? { |elem| elem == 4 }

# p Enumerable::my_all? (array) { |elem| elem < 10 }
# p array.all? { |elem| elem < 10}

# p Enumerable::my_select (array) { |elem| elem.odd? }
# p array.select{ |elem| elem.odd? }

# array.each_with_index do |elem,index|
#     puts "elem: " + elem.to_s + ", index:" + index.to_s
# end

# Enumerable::my_each_with_index (array) do |elem, index| 
# puts "elem: " + elem.to_s + ", index:" + index.to_s
# end


# array.each do |elem|
#     puts elem
# end
# # 2 4 6 8 10
# Enumerable::my_each (array) { |elem| puts elem } 
# # 2 4 6 8 10


