defmodule Oca.Game do
  @moduledoc """
  Documentation for Oca.Game

  This is the module that contains most of the logic for the game. The basic idea is to have the game struct being the state for the entire game.

  The function Oca.Game.turn() applies a turn to the board. We should then get a new board with the new state.

  """

  @doc """
  Game struct

  ## Examples
       %Oca.Game{}
       %Oca.Game{ players: [], current_player: 0, board: %Oca.Board{...}}
  """
  defstruct players: [], 
    current_player: 0, 
    active: false,
    turn_number: 1,
    board: %Oca.Board{}

  @doc """
  Location of player

  ## Parameters
  game, %Oca.Game{}, current game state
  player_name, String, name of player

  Returns Integer, position of player

  ## Examples
      
        Oca.Game.position_of("playerr one") 
        1

  """
  def position_of(game, player_name) do
    Map.get(game.board.player_positions, player_name)
  end

  @doc """
  Starts the game

  Returns %Oca.Game{}

  ## Notes
  It has to have at least two players to play 
  ## Examples
     
      iex> game = %Oca.Game{}
      iex> game.active
      false
      iex> game = %{game | players: [%Oca.Player{}, %Oca.Player{}] }
      iex> game = Oca.Game.start(game)
      iex> game.active
      true

  """
  def start(game) do
    cond do
      Enum.count(game.players) > 1 ->
        game
        |> place_players_in_start
        |> turn_game_active
      true ->
      game
    end
  end

  defp place_players_in_start(game) do
    positions =  %{}

    positions = 
      game.players
      |> Enum.into(%{}, 
        fn player -> {player.name, 1} end) 

    %{game | board: 
      %{game.board | player_positions: positions }}
  end

  defp turn_game_active(game) do
    %{game | active: true}
  end

  @doc """
  Executes a turn for a player

  Returns %Oca.Game{}

  ## Examples

       turn_0 =  %Oca.Game{}
       turn_1 = Oca.Game(turn_0)
  """
  def turn(game)  do
    case  game.active do
      false -> game
      true -> 
        game 
        |> roll
        |> move
        |> next_player
        |> increment_turn
    end
  end

  defp roll(game) do
    {game, Oca.Dice.roll()}
  end

  defp move({game, {d1, d2}}) do
    player = Enum.at(game.players, game.current_player)
    position = position_of(game, player.name) + (d1 + d2) 

    positions = %{ game.board.player_positions | player.name => position }

   %{game | board: %{game.board | player_positions: positions}}
  end

  defp next_player(game) do
    %{ game | current_player: 
      rem((game.current_player + 1), 
           Enum.count(game.players)) }
  end

  defp increment_turn(game) do
    %{game | turn_number: game.turn_number + 1 }
  end
end
