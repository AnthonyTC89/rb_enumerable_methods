# frozen_string_literal: true

module Enumerable
  def my_each
    length.times do |i|
      yield self[i]
    end
  end

  def my_each_with_index
    length.times do |i|
      yield self[i], i
    end
  end

  def my_select
    aux_array = []
    length.times do |i|
      aux_array << self[i] if yield self[i]
    end
    aux_array
  end

  def my_all?
    length.times do |i|
      return false unless yield self[i]
    end
    true
  end

  def my_any?
    length.times do |i|
      return true if yield self[i]
    end
    false
  end

  def my_none?
    length.times do |i|
      return false if yield self[i]
    end
    true
  end

  def my_count
    count = 0
    length.times do |i|
      count += 1 if yield self[i]
    end
    count
  end

  def my_map(*my_proc)
    if my_proc.empty?
      length.times do |i|
        self[i] = yield self[i]
      end
    else
      length.times do |i|
        self[i] = my_proc[0].call(self[i])
      end
    end
    self
  end

  def my_inject
    memo = self[0]
    (length - 1).times do |i|
      memo = yield memo, self[i + 1]
    end
    memo
  end
end

def multiply_els(array)
  array.my_inject { |elem, n| elem * n }
end

array = [1, 2, 3, 4, 5]

p array.my_map() { |elem| elem + 2 }

p array.my_map(proc { |elem| elem * 2 })

p array.map() { |elem| elem * 2 }

# p multiply_els array
# p array.inject { |elem, n| elem * n}

# p array.my_inject { |elem, n| elem + n}
# p array.inject { |elem, n| elem + n}

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
