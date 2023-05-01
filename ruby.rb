### General ###
# puts 20.times { print "-"}

### String ###
# fn = "nay myo"
# ln = "lwin"

# available methods
# puts fn.methods
# puts fn.class

## substitute
# puts fn.sub("myo", "nay")
# puts fn.gsub("myo", "nay")

# first_name = "Nay"
# new_first_name = first_name

# first_name = "Nay Nay"
# puts new_first_name 
## even tho they are object, first_name is reassign to new location memory. not the same as JS

## \ (escape character)
## getting user input
# input = gets.chomp
## gets.chomp get you string
# puts "hello #{input}"

### Number ###
# puts 1 + 2
# 20.times {puts "hello"}
# puts rand(10)

### comparison operator ###
# ==
# !=
# >
# <
# .eql?() will compare type

# puts 10 === "10".to_f

### Methods ###
# num1 = 3
# num2 = 4

# def multiply (num1, num2)
#     num1.to_f * num2.to_f #the last line will automatically return or can put return keyword
# end

# puts multiply(num1,num2)

### Branching (conditionals) ###
# if (true && true) || false
#     puts "true"
# elsif (true || false)
# else puts "false"
# end

### Arrays and Iterators ###
# str = "abcdefg"
 arr = [1,2,3,4,5,6,7,8,9]
# arr2 = 1..100 #range
# arr3 = (1..100).to_a #range
# arr2 = arr2.to_a
# arr2 = arr2.shuffle! # ! will mutate the original 
# arr.last
# p arr2
# arr << 10 # add 10 to end of array
# arr.append(11) # add 10 to end of array
# arr.push(12) # add 12 to end of array
# arr.unshift(0) # add 0 to begining of array
# arr.pop # remove the last item from array
# arr.shift # remove the first item from array
# arr.uniq! # remove duplicates
# arr.empty? # check if empty or not
# arr.include?(10) # check if the item is include or not
# p arr.join # join array as string
# p arr.join("_") # join array as string
# p str.split(",")
# p arr
# p %w(nay myo lwin) # trun each word in to array

# for i in arr
#     p i
# end

# arr.each do |i|
#     p i
# end

# arr.each {|i| p i+10}

# p arr.select{|num| num.odd?}


