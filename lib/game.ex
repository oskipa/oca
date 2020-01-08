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
    board: %Oca.Board{}


  def hello do
    "world" 
  end
end
