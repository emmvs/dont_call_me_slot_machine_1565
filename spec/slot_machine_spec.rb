require_relative "../slot_machine_w_comments"

def test_scenario(reels, expected_score)
  it "returns #{expected_score} for #{reels[0]}/#{reels[1]}/#{reels[2]}" do
    slot_machine = SlotMachine.new(reels)
    score = slot_machine.score
    expect(score).to eq(expected_score)
  end
end

describe SlotMachine do
  describe "Class" do
    it "Should be a class" do
      slot_machine = SlotMachine.new
      expect(slot_machine.class).to eq(SlotMachine)
    end
  end

  describe "Methods" do
    describe '#score' do
      it 'returns 0 for three different symbols' do
        slot_machine = SlotMachine.new(%w[🃏 ⭐️ bell])
        score = slot_machine.score
        expect(score).to eq(0)
      end

      test_scenario(%w[🃏 🃏 🃏], 50)
      test_scenario(%w[⭐️ ⭐️ ⭐️], 40)
      test_scenario(%w[🔔 🔔 🔔], 30)
      test_scenario(%w[7️⃣ 7️⃣ 7️⃣], 20)
      test_scenario(%w[🍒 🍒 🍒], 10)

      test_scenario(%w[🃏 🃏 ⭐️], 25)
      test_scenario(%w[🃏 🃏 🔔], 25)
      test_scenario(%w[🃏 🃏 7️⃣], 25)
      test_scenario(%w[🃏 🃏 🍒], 25)

      test_scenario(%w[⭐️ ⭐️ 🃏], 20)
      test_scenario(%w[🔔 🔔 🃏], 15)
      test_scenario(%w[7️⃣ 7️⃣ 🃏], 10)
      test_scenario(%w[🍒 🍒 🃏], 5)

      test_scenario(%w[⭐️ ⭐️ 🔔], 0)
      test_scenario(%w[⭐️ ⭐️ 7️⃣], 0)
      test_scenario(%w[⭐️ ⭐️ 🍒], 0)
      test_scenario(%w[🔔 🔔 ⭐️], 0)
      test_scenario(%w[🔔 🔔 7️⃣], 0)
      test_scenario(%w[🔔 🔔 🍒], 0)
      test_scenario(%w[7️⃣ 7️⃣ ⭐️], 0)
      test_scenario(%w[7️⃣ 7️⃣ 🔔], 0)
      test_scenario(%w[7️⃣ 7️⃣ 🍒], 0)
      test_scenario(%w[🍒 🍒 ⭐️], 0)
      test_scenario(%w[🍒 🍒 🔔], 0)
      test_scenario(%w[🍒 🍒 7️⃣], 0)
    end
  end
end
