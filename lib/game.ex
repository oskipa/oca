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
       %Oca.Game{ players: [], current_player_index: 0, board: %Oca.Board{...}}
  """
  defstruct players: [], 
    current_player_index: 0, 
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
      
        Oca.Game.position_of("player one") 
        1

  """
  def position_of(game, player_name) do
    Map.get(game.board.player_positions, player_name)
  end

  @doc """
  Returns the current player struct

  ## Params
  - game,  Oca.Game{}, the game state

  ## Returns
  Oca.Player{}, the current player

  """
  def current_player(game) do
    Enum.at(game.players, game.current_player_index)
  end

  @doc """
  Sets the position of a player on the board
  ## Params
  - game, %Oca.Game{}, game state
  - player, %Player.{}, the current player
  - position, Integer, the space to move the player
  
  ## Returns
  - %Oca.Game{}, updated game state
  """
  def set_position(game, player, position) do
    positions = %{ game.board.player_positions | player.name => position }
    
    %{game | board: %{game.board | player_positions: positions}}
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
        |> play
        |> next_player
        |> increment_turn
    end
  end

  defp roll(game) do
    {game, Oca.Dice.roll()}
  end

  defp play({game, dice}) do
    player = current_player(game)

    case  position_of(game, player.name) do
      1  -> 
        initial_roll(game, player, dice)
      _ -> 
        advance(game, player, dice) 
    end
  end

  defp initial_roll(game, player, dice) do
    case dice do
      {6, 3} -> goto(game, player, 26)
      {3, 6} -> goto(game, player, 26)
      {5, 4} -> goto(game, player, 53)
      {4, 5} -> goto(game, player, 53)
      {_, _} -> advance(game, player, dice)
    end
  end

  defp goto(game, player, position) do
    positions = %{ game.board.player_positions | player.name => position }
    # implement this tomorrow
    # game = update_player(game, player) 
    %{game | board: %{game.board | player_positions: positions}}
  end

  defp update_player(game, player) do
    
  end

  @doc """
  Enforces the rules

  Return %Oca.Game{}
  
  ## Params
    - game, %Oca.Game{}, the game state
    - player, %Oca.Player{}, the current player
    - dice, {Integer, Integer}, the dice roll values

  ## Notes
  This function implements the game rules as part of the movement. It creates a search graph until we reach a square with no move  event.
  """
  defp advance(game, player, {d1, d2}) do
    forward = d1 + d2
    new_position  = position_of(game, player.name) + forward

    case Oca.Board.square_event(game.board, new_position) do
      {_,  {:lose_turn, turns}} ->
        goto(game, Oca.Player.set_lost_turns(player, turns), new_position) 
      {_, {:goose}}       -> 
        goto(game, player, new_position) 
        advance(game, player, {d1, d2}) 
      {_, {:goto, space}} -> 
        goto(game, player, space) 
       _                  -> 
        goto(game, player, new_position) 
    end 
  end

  defp next_player(game) do
    %{ game | current_player_index: 
      rem((game.current_player_index + 1), 
           Enum.count(game.players)) }
  end

  defp increment_turn(game) do
    %{game | turn_number: game.turn_number + 1 }
  end
end
