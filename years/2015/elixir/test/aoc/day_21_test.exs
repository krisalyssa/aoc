defmodule AoC.Day21.Test do
  @moduledoc false

  use ExUnit.Case, async: false

  alias AoC.Day21

  # comment this out to always log to the console
  @moduletag :capture_log

  describe "part 1" do
    test "with sample data" do
      assert Day21.part_1(["../data/21.txt"]) == 1
    end
  end

  describe "part 2" do
    test "with sample data" do
      assert Day21.part_2(["../data/21.txt"]) == 1
    end
  end
end