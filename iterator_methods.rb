module Enumerable
    def my_each
        self.length.times do |i|
            yield self[i]
        end
    end

    def my_each_with_index
        self.length.times do |i|
            yield self[i], i
        end
    end
    
    def my_select
        aux_array = []
        self.length.times do |i|
            if yield self[i]
                aux_array << self[i]
            end
        end
        return aux_array
    end

    def my_all? 
        self.length.times do |i|
            if !yield self[i]
                return false
            end
        end
        return true
    end

    def my_any?
        self.length.times do |i|
            if yield self[i]
                return true
            end
        end
        return false
    end

    def my_none?
        self.length.times do |i|
            if yield self[i]
                return false
            end
        end
        return true
    end

    def my_count
        count = 0
        self.length.times do |i|
            if yield self[i]
                count += 1
            end
        end
        return count
    end

    # def my_map
    #     self.length.times do |i|
    #         self[i] = yield self[i]
    #     end
    #     return self
    # end

    def my_map (my_proc)
        self.length.times do |i|
            self[i] = my_proc.call(self[i])
        end
        return self
    end

    def my_inject
        memo = self[0]
        (self.length-1).times do |i|
            memo = yield memo, self[i+1]
        end
        return memo
    end
end

def multiply_els array
    return array.my_inject { |elem, n| elem * n}
end

array = [1,2,3,4,5]

p array.my_map(Proc.new { |elem| elem * 2 })
p array.map { |elem| elem * 2}

# p multiply_els array
# p array.inject { |elem, n| elem * n}

# p array.my_inject { |elem, n| elem + n}
# p array.inject { |elem, n| elem + n}

# p array.my_map {|elem| elem + 2}
# p array.map { |elem| elem + 2}

# p array.my_count {|elem| elem > 2}
# p array.count { |elem| elem > 2}

# p array.my_none? {|elem| elem == 7}
# p array.none? {|elem| elem == 7}

# p array.my_any? { |elem| elem == 4 }
# p array.any? { |elem| elem == 4 }

# p array.my_all? { |elem| elem < 10 }
# p array.all? { |elem| elem < 10}

# p array.my_select { |elem| elem.odd? }
# p array.select{ |elem| elem.odd? }

# array.each_with_index {|elem,index| p "elem: " + elem.to_s + ", index:" + index.to_s} 
# array.my_each_with_index { |elem, index| p "elem: " + elem.to_s + ", index:" + index.to_s }

# array.each {|elem| p elem }
# array.my_each { |elem| p elem } 





