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

