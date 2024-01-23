# TODO: Create a constructor to initialize the SlotMachine class with an array of reels
# TODO: Provide a default empty array for reels
# TODO: Implement a method to play the slot machine
# TODO: Generate random symbols for the reels and return the result
# TODO: Implement a method to calculate the score based on the generated reels
# TODO: Check for three identical symbols or two identical symbols with a joker (🃏)
# TODO: and calculate the score accordingly.
# TODO: Sorting the array of 3 symbols to make sure index 1 is one of the pair
# TODO: Implement a private helper method to check for three identical symbols
# TODO: Implement a private helper method to check for two identical symbols and a joker
# TODO: Implement a private method to calculate the base score for a given symbol


class SlotMachine
  SYMBOLS = ["🍒", "7️⃣", "🔔", "⭐️", "🃏"]
#              0    1     2     3    4      + 1
# 3 times     10    20    30    40   50
# 2 times + 🃏 5    10    15    20   25

  def initialize(reel = [])
    @reel = reel
  end

  def play
    @reel = []
    3.times do
      @reel << SYMBOLS.sample
    end
    return @reel
  end

  def score
    if @reel.uniq.count == 1 # Three identical (Base Score of each symbol times 10)
      return base_score(@reel.uniq.first) * 10
    elsif @reel.uniq.count == 2 && @reel.include?("🃏") # Two identical & Joker
      return (base_score(@reel.uniq.first) * 10) / 2
    else
      return 0
    end
  end

  def base_score(symbol)
    SYMBOLS.index(symbol) + 1
    # => "cherry" = 0 + 1
  end
end

slotmachine = SlotMachine.new
p slotmachine.play
p slotmachine.score

























# class SlotMachine
#   SYMBOLS = [ "cherry",  "seven", "bell", "star", "joker"]
#   #               0         1       2       3       4
#   def initialize(reels = [])
#     @reels = reels
#   end

#   def play
#     @reels = []
#     3.times do
#       @reels << SYMBOLS.sample
#     end
#     return @reels
#   end

#   def score
#     if @reels.uniq.size == 1 # Three idendical
#       return base_score(@reels.first) * 10
#     elsif @reels.uniq.size == 2 && @reels.include?('🃏')
#       # calculate based on the scoring of column 2
#       return base_score(@reels.sort[1]) * 5
#     else
#       return 0
#     end
#   end

#   # calculate based on the scoring on column 1
#   # 3 Jokers => 50
#   # 3 Stars => 40
#   # 3 Bells => 30
#   # 3 Sevens => 20
#   # 3 Cherry => 10
#   def base_score(symbol)
#     SYMBOLS.index(symbol) + 1
#   end

# end
