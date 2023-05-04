### General ###
# puts 20.times { print "-"}

### String ###
# fn = "nay myo"
# ln = "lwin"

# String in Ruby are mutable
# my_string = 'hello'
# my_string[1] = 'a'
# puts my_string
# # => hallo

# .ord # string to unicode number
# .chr # unicode number to string
# .strip # remove white space from begining and end of string

# available methods
# puts fn.methods
# puts fn.class

## substitute
# puts fn.sub("myo", "nay")
# puts fn.gsub("myo", "nay")

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

# case variable
# when "a"
#     # do this
# when "b"
#     # do this
# else
# end

### Arrays and Iterators ###
# str = "abcdefg"
# arr = [1,2,3,4,5,6,7,8,9]
# puts arr.length
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
# arr.delete_at(2) # delete index 2
# arr.delete(2) # delete index 1 that contain number 2
# arr.include?(10) # check if the item is include or not
# arr.slice(2..4) # slice array to 2 to 4 inclusive
# arr.slice(2,0) # slice array start from 2 for 0 item, return empty array
# arr.slice(2,1) # slice array start from 2 for 1 item, return 3
# arr + arr # concat arr to arr
# arr.reverse
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

# break # will break from the loop
# next # will skip the current iteration

# arr.each {|i| p i+10}

# p arr.select{|num| num.odd?}

# friends = ['Betty', 'Mary', 'Jane', 'David', 'Peter']
# # Modify the code below
# male_friends = friends[3..-1]
# female_friends = friends[0..2]
# puts male_friends
# # -> ['David', 'Peter']
# puts female_friends
# # -> ['Betty', 'Mary', 'Jane']

### hash or dictionary ###
# hash = {'a' => 1, 'b' => 2, 'c' => 3}
# hash2 = {a: 1, b: 2, c: 3} #symbol
# property = :a
# hash2[property] #=> 1
# p hash['a']
# p hash2[:b]
# p hash2.keys
# p hash2.values

# hash2.each {|key,value| p "#{key.class},#{value}"}

# hash2[:d] = 4
# p hash2

# p hash2.select {|k,v| v.is_a?(String)}
# p hash2.select {|k,v| v.odd?}
# hash2.delete(:d)
# p hash2

### Ruby Style Guide ###
## https://github.com/rubocop/ruby-style-guide
# snake_case
# CamelCase
# camelCase
# use 2 space for indentation
# class name CamelCase

### Intro to OOP ###
# class Student
#     attr_accessor :first_name, :last_name #no need to getter and setter if we use attr_accessor

#     # @first_name
#     # @last_name

#     def initialize(first_name, last_name)
#         @first_name = first_name
#         @last_name = last_name
#     end

#     # # setter
#     # def first_name=(name)
#     #     @first_name = name
#     # end

#     # # getter
#     # def first_name 
#     #     @first_name
#     # end

#     # def to_s
#     #     @first_name
#     # end

# end

# # nay = Student.new
# # nay.first_name = "Nay"
# # p nay.first_name
# nay = Student.new("Nay Myo", "Lwin")
# puts nay.first_name

# require 'bcrypt'

# my_password = BCrypt::Password.create("my password")
# #=> "$2a$12$K0ByB.6YI2/OYrB4fQOYLe6Tv0datUVf6VZ/2Jzwm879BW5K1cHey"
# puts my_password
# my_password = BCrypt::Password.new("$2a$12$K0ByB.6YI2/OYrB4fQOYLe6Tv0datUVf6VZ/2Jzwm879BW5K1cHey")

# my_password.version              #=> "2a"
# my_password.cost                 #=> 12
# my_password == "my password"     #=> true
# my_password == "not my password" #=> false

# a = [1,2]
# b = a
# a.push(3)
# puts a
# puts b

# c = {a: 1, b: 2}
# d = c
# c[:c] = 3

# puts c
# puts d
class Dog

    @@count = 0
  
    def initialize 
      @@count += 1  
    end
  
    def self.count # need this to retrieve the @@count
      @@count
    end
  end

  class Shiba < Dog
  end
  
  new_dog_1 = Dog.new
  new_dog_2 = Dog.new
  new_dog_3 = Dog.new
  shiba_new_1 = Shiba.new

  puts Dog.count