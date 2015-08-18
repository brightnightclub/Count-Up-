require "rspec"
require_relative "../count_up"

describe CountUp do
  context "input 0, target 0" do
    it "returns 0" do
      input_num = 0
      usable_nums = [0]
      expect(CountUp.generate_solutions(input_num, usable_nums))
      .to eq(0)
    end
  end

  context "input 1, target 2" do
    it "returns 1 + 1" do
      input_num = 2
      usable_nums = [1]
      expect(CountUp.generate_solutions(input_num, usable_nums))
      .to eq("1 + 1")
    end
  end

  context "input [3,2], target 10" do
    it "returns 2 + 2 + 2 + 2 + 2" do
      input_num = 10
      usable_nums = [3, 2]
      expect(CountUp.generate_solutions(input_num, usable_nums))
      .to eq("2 + 2 + 2 + 2 + 2")
    end
  end
end
