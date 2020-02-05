defmodule Oca.RulesTest do
  use ExUnit.Case
  doctest Oca.Rules

  setup_all do
    zero = %Oca.Game{ 
      players: [
        %Oca.Player{name: "thing one"}, 
        %Oca.Player{name: "thing two"}] }

    game = Oca.Game.start(zero)

    {:ok, %{start: game}}
  end

  test "setup " do
    assert true
  end

  test "it moves the player", context do
      start = context[:start]
      player = Oca.Game.current_player(start)
      turn_1 = Oca.Rules.goto(start, player, 3)

      assert Oca.Game.position_of(turn_1, "thing one") == 3
    end


end
