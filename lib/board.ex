defmodule Oca.Board do
  @moduledoc """
  Documentation for Oca.Board
  """

  @doc """
  Board struct

  ## Examples


  """
  defstruct pot: 0,
    player_positions: %{},
    event_spaces: %{ 
      5 => {"Goose", {:goose}},
      6 => {"Bridge", {:goto, 12}},
      9 => {"Goose", {:goose}},
      14 => {"Goose", {:goose}},
      18 => {"Goose", {:goose}},
      19 => {"Inn", {:lose_turn, 1}},
      23 => {"Goose", {:goose}},
      26 => {"6 & 3 lands here", {}},
      27 => {"Goose", {:goose}},
      31 => {"Well", {:lose_turn, 1}},
      32 => {"Goose", {:goose}},
      36 => {"Goose", {:goose}},
      41 => {"Goose", {:goose}},
      42 => {"Maze", {:goto, 30}},
      45 => {"Goose", {:goose}},
      50 => {"Goose", {:goose}},
      52 => {"Prison", {:lose_turn, 1}},
      53 => {"5 & 4 lands here", {}},
      54 => {"Goose", {:goose}},
      58 => {"Death", {:goto, 1}},
      59 => {"Goose", {:goose}},
      63 => {"Goal", {:win}}
    }

  def square_event(board, position) do
    case Map.fetch(board.event_spaces, position) do
    {:ok, value} -> value
    :error       -> {"Nothing", {}}
    end
  end

end
