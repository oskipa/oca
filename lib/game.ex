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
  Starts the game

  Returns %Oca.Game{}

  ## Notes
  
  ## Examples
     
      iex> game = %Oca.Game{}
      iex> game.active
      false
      iex> game = Oca.Game.start(game)
      iex> game.active
      true

  """
  def start(game) do
    %{game | active: true}
  end

  def turn(game) do
    game
  end
end
