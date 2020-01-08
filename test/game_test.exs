defmodule Oca.GameTest do
  use ExUnit.Case

  test "creates a game struct" do
    game = %Oca.Game{}
    assert Map.has_key?(game, :players) 
    assert Map.has_key?(game, :board) 
    assert Map.has_key?(game, :current_player) 
    assert Map.has_key?(game, :active) 
  end 
end
