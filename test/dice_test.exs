defmodule Oca.DiceTest do
  use ExUnit.Case
  doctest Oca.Dice

  test "test that dice returns a tuples with two values" do
    result = Oca.Dice.roll()

    assert tuple_size(result) == 2
  end
end
