# 🧠 THE MENTAL MODEL: "Ruby is a conversation between objects"
# Think of your Ruby program as a group of objects talking to each other by sending messages.

# Instead of saying:

# "I'm calling a function on this class"

# You say:

# "I'm asking this object to do something — I'm sending it a message"

# 🧍‍♀️ Objects as Actors
# Imagine every object in your Ruby program is an actor in a play. Each actor has a script (its methods), and when you send it a message, it decides how to respond — using its script.

# This makes it easy to model:

# Dynamic behaviour (the same message can mean different things depending on who you send it to)

# Loose coupling (you don’t care how the object does something, only that it can respond)


# 🔁 Applying the model in practice
# 1. 🦆 Duck Typing
# "If it walks like a duck and quacks like a duck, it is a duck."

# You're not asking “is this a specific class?”
# You're asking “can this object respond to the message I’m about to send it?”

def shout(word)
  word.upcase
end

shout("hi")       # => "HI"
shout(:hello)     # => error, Symbols don’t respond to `upcase`

# Fix with duck typing check:

def shout(word)
  raise ArgumentError unless word.respond_to?(:upcase)
  word.upcase
end

# Now you’re explicitly checking: “Hey object, can you respond to the :upcase message?”
# → You don’t care what class the object is, just that it understands your message.

# 2. 🔄 Dynamic Method Calls
# You can call methods dynamically, using a variable instead of a hard-coded method name.
# This is useful when you want to call different methods based on user input or other runtime conditions.

class Spell
  def fire
    puts "🔥 Fire spell cast!"
  end

  def ice
    puts "❄️ Ice spell cast!"
  end
end

magic = Spell.new

[:fire, :ice].each { |s| magic.send(s) } # dynamically call methods

# A dynamic method call means:
# You're calling a method at runtime, using a variable (not a hard-coded method name).
# In Ruby, this is usually done using .send or .public_send.

# 3. 🛡️ send vs public_send
# 🚫 Safer alternative: public_send

user.public_send(:name)
# Unlike send, this won't allow calling private methods, which protects you from doing weird or dangerous things accidentally.


# removes the items based on the block condition
reject! { |item| block } → ary or nil


# It transforms each element in an array (or enumerable) based on the logic you provide in a block, and returns a new array with the results.
array.collect { |element| ... }
array.map { |element| ... }

# delete_if modifies the original array or hash by deleting elements for which the block returns true.
nums = [1, 2, 3, 4, 2, 5]
nums.delete_if { |n| n == 2 }
puts nums
# => [1, 3, 4, 5]


# If you're not sure whether you want to change the original array, stick with reject or use dup to create a copy:
new_nums = nums.dup.delete_if { |n| n == 2 }


# From this point on, you’ll be working with larger and larger chunks
# of Ruby code. It’s likely, though, that you’ll still want to try out meth-
# ods in irb. But method definitions are awkward to type. Once you hit
# Enter , you can’t correct an error without retyping the whole method.
# One alternative is to edit the method in a file and then paste it into irb
# (as described in Section 2.6, Working with Prompts, on page 25).
# An alternative I often prefer is to make the whole Ruby script loadable.
# That means the script executes normally when run from the command
# line but can also be loaded into irb so that all its methods are available.


prompt> irb
irb(main):001:0> load 'exercise-differences.rb'
=> true
irb(main):002:0> boring?('/temp/foo')
=> true




# Another useful iterator is any?. It returns true if any of the array
# elements make the attached block return true. To ask whether any
# deposit is big enough to report to the authorities, you could type
# this:
irb(main):004:0> deposits = [1, 0, 10000]
irb(main):005:0> deposits.any? do | deposit |
irb(main):006:1* deposit > 9999
irb(main):007:1> end
=> true
# You can read that as “you are given a list of three deposits. Is
# anydeposit greater than 9999?”


#  p 60.

