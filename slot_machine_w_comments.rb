# TODO: Initialize the SlotMachine class w/ array of reels
# TODO: Provide a default empty array for reels (constructor)
# TODO: Implement a method to play the slot machine
# TODO: Generate random symbols for the reels and return the result
# TODO: Implement a method to calculate the score based on the generated reels
# TODO: Check for three identical symbols or two identical symbols with a joker (🃏) & calculate the score accordingly
# TODO: Sorting the array of 3 symbols to make sure index 1 is one of the pair


class SlotMachine
  SYMBOLS = %w[🍒 7️⃣ 🔔 ⭐️ 🃏]
  #             0 1  2  3  4

  def initialize(reels = [])
    @reels = reels
  end

  def play
    @reels = []
    3.times do
      @reels << SYMBOLS.sample
    end
    return @reels
  end

  # Score Method
  # if three identical we want a base score of each symbol
  # if two identical + one joker we want half of base score of each symbol
  def score
    if @reels.uniq.count == 1
      return base_score(@reels.uniq.first) * 10
    elsif @reels.uniq.count == 2 && @reels.include?("🃏")
      return (base_score(@reels.uniq.first) * 10) / 2
    else
      return 0
    end
  end

  def base_score(symbol)
    return SYMBOLS.index(symbol) + 1
  end
end

emmas_first_slot_machine = SlotMachine.new
p emmas_first_slot_machine.play
