defmodule Oca.GameTest do
  use ExUnit.Case
  doctest Oca.Game

  test "creates a game struct" do
    game = %Oca.Game{}
    assert Map.has_key?(game, :players) 
    assert Map.has_key?(game, :board) 
    assert Map.has_key?(game, :current_player) 
    assert Map.has_key?(game, :active) 
    assert Map.has_key?(game, :turn_number) 
  end 

  test "turn doesn't work if game not active" do
    game = %Oca.Game{}
    after_turn = Oca.Game.turn(game)

    assert game == after_turn 
    assert after_turn.turn_number == 1
    assert after_turn.active == false
  end

  test "make the game active" do
    game = %Oca.Game{}
    assert game.active == false

    game = Oca.Game.start(game)
    assert game.active == true
  end
end
