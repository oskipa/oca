defmodule Oca.PlayerTest do
  use ExUnit.Case
  doctest Oca.Player

  test "creates a player that defaults to 100 money" do
    player = %Oca.Player{}
    assert  player.money == 100
  end

end
