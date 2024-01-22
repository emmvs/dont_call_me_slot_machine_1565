class SlotMachine
  SYMBOLS = %w[🍒 7️⃣ 🔔 ⭐️ 🃏]

  def initialize(reels = [])  # Provide default empty reels
    @reels = reels
  end

  def play
    @reels = []
    3.times do
      @reels << SYMBOLS.sample
    end

    return @reels
  end

  def score
    if three_identical?
      return base_score(@reels[0]) * 10
    elsif two_identical_and_joker?
      # sorting the array of 3 strings to make sure index 1 is one of the pair
      return base_score(@reels.sort[1]) * 5
    else
      return 0
    end
  end

  private
  def three_identical?
    @reels.uniq.size == 1
  end

  def two_identical_and_joker?
    @reels.uniq.size == 2 && @reels.include?('🃏')
  end

  def base_score(symbol)
    SYMBOLS.index(symbol) + 1
  end
end

# load "./slot_machine.rb"
# slot_machine = SlotMachine.new
# slot_machine.play
# # => ['⭐️' '⭐️' '🃏']
# score = slot_machine.score
# # => 20
