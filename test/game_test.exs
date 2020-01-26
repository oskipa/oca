defmodule Oca.GameTest do
  use ExUnit.Case
  doctest Oca.Game

  setup_all do
    zero = %Oca.Game{ 
      players: [
        %Oca.Player{name: "thing one"}, 
        %Oca.Player{name: "thing two"}] }

    game = Oca.Game.start(zero)

    {:ok, %{start: game}}
  end

  test "creates a game struct" do
    game = %Oca.Game{}
    assert Map.has_key?(game, :players) 
    assert Map.has_key?(game, :board) 
    assert Map.has_key?(game, :current_player_index) 
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

  test "make active only if it has players" do
    game = %Oca.Game{}
    game = Oca.Game.start(game)
    assert game.active == false

    game = %{game | players: [ %Oca.Player{}, %Oca.Player{}]}
   
    game = Oca.Game.start(game)
    assert game.active == true
  end

   test "make the game active" do
    game = %Oca.Game{}
    assert game.active == false

    game = %{game | players: [%Oca.Player{}, %Oca.Player{}]}

    game = Oca.Game.start(game)
    assert game.active == true
  end
 
  test "start sets players in position 1" do
    game = %Oca.Game{}
    assert game.active == false

    game = %{game | players: [%Oca.Player{name: "thing one"}, %Oca.Player{name: "thing two"}]}

    game = Oca.Game.start(game)
    assert Oca.Game.position_of(game, "thing one" )  == 1
  end

  test "current_player gets player struct", context do
    start = context[:start]
    game = Oca.Game.start(start)
    player = Oca.Game.current_player(game)

    assert player.__struct__  == Oca.Player
  end

  describe "turn" do
    test "does nothing when the game is not active" do
      start = %Oca.Game{}
      game = Oca.Game.turn(start)

      assert start == game
    end

    test "increments turn number", context do
      start = context[:start]
      turn_1 = Oca.Game.turn(start)

      assert turn_1.turn_number == 2
    end

    test "updates current player", context do
      start = context[:start]
      turn_1 = Oca.Game.turn(start)

      assert turn_1.current_player_index == 1
    end
   
  end

end
