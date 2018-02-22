# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class NoCoffeeError < StandardError
  def message
    puts "I have no coffee error"
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Can you feed me coffee? (Enter y/n)"
    coffee_boolean = gets.chomp.downcase
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit, coffee_boolean)
  rescue NoCoffeeError => e
    e.message
  rescue StandardError
    puts "That's not fruit"
    retry
  end
end

def reaction(maybe_fruit, coffee_boolean)
    if FRUITS.include?(maybe_fruit) == false && coffee_boolean == "y"
      raise StandardError
    elsif FRUITS.include?(maybe_fruit) == false && coffee_boolean == "n"
      raise NoCoffeeError
    end
    puts "OMG, thanks so much for the #{maybe_fruit}!"
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime

    if @name.length == 0 || @fav_pastime.length == 0
      raise ArgumentError.new("Blank name or pasttime")
    end
  end

  def talk_about_friendship
    begin
      puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
      raise NotEnoughTimeError if @yrs_known < 5
    rescue NotEnoughTimeError => e
        e.message
    end
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end

class NotEnoughTimeError < ArgumentError
  def message
    puts "Not enough time for frindship"
  end
end
