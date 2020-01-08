defmodule Oca.Board do
  @moduledoc """
  Documentation for Oca.Board
  """

  @doc """
  Board struct

  ## Examples

      iex>board =  %Oca.Board{}
      iex> Enum.count(board.spaces)
      63

  """
  defstruct pot: 0, 
    spaces: [ 
      %Oca.Space{number: 1, name: "Start", player: nil, event: {} },
      %Oca.Space{number: 2, name: "", player: nil, event: {} },
      %Oca.Space{number: 3, name: "", player: nil, event: {} },
      %Oca.Space{number: 4, name: "", player: nil, event: {} },
      %Oca.Space{number: 5, name: "Goose", player: nil, event: {"goose", {:goose} }},
      %Oca.Space{number: 6, name: "Bridge", player: nil, event: {"bridge", {:goto, 12}} },
      %Oca.Space{number: 7, name: "", player: nil, event: {} },
      %Oca.Space{number: 8, name: "", player: nil, event: {} },
      %Oca.Space{number: 9, name: "Goose", player: nil, event: {"goose", {:goose} }},
      %Oca.Space{number: 10, name: "", player: nil, event: {} },
      %Oca.Space{number: 11, name: "", player: nil, event: {} },
      %Oca.Space{number: 12, name: "", player: nil, event: {} },
      %Oca.Space{number: 13, name: "", player: nil, event: {} },
      %Oca.Space{number: 14, name: "Goose", player: nil, event: {"goose", {:goose} }},
      %Oca.Space{number: 15, name: "", player: nil, event: {} },
      %Oca.Space{number: 16, name: "", player: nil, event: {} },
      %Oca.Space{number: 17, name: "", player: nil, event: {} },
      %Oca.Space{number: 18, name: "Goose", player: nil, event: {"goose", {:goose} }},
      %Oca.Space{number: 19, name: "Inn", player: nil, event: {"inn", {:lose_turn, 1}} },
      %Oca.Space{number: 20, name: "", player: nil, event: {} },
      %Oca.Space{number: 21, name: "", player: nil, event: {} },
      %Oca.Space{number: 22, name: "", player: nil, event: {} },
      %Oca.Space{number: 23, name: "Goose", player: nil, event: {"goose", {:goose} }},
      %Oca.Space{number: 24, name: "", player: nil, event: {} },
      %Oca.Space{number: 25, name: "", player: nil, event: {} },
      %Oca.Space{number: 26, name: "Come here if you roll 6 & 3 on the first roll", player: nil, event: {}},
      %Oca.Space{number: 27, name: "Goose", player: nil, event: {:goose}},
      %Oca.Space{number: 28, name: "", player: nil, event: {} },
      %Oca.Space{number: 29, name: "", player: nil, event: {} },
      %Oca.Space{number: 30, name: "", player: nil, event: {} },
      %Oca.Space{number: 31, name: "Well", player: nil, event: {:lose_turn, 1} },
      %Oca.Space{number: 32, name: "Goose", player: nil, event: {:goose} },
      %Oca.Space{number: 33, name: "", player: nil, event: {} },
      %Oca.Space{number: 34, name: "", player: nil, event: {} },
      %Oca.Space{number: 35, name: "", player: nil, event: {} },
      %Oca.Space{number: 36, name: "Goose", player: nil, event: {:goose} },
      %Oca.Space{number: 37, name: "", player: nil, event: {} },
      %Oca.Space{number: 38, name: "", player: nil, event: {} },
      %Oca.Space{number: 39, name: "", player: nil, event: {} },
      %Oca.Space{number: 40, name: "", player: nil, event: {} },
      %Oca.Space{number: 41, name: "Goose", player: nil, event: {:goose} },
      %Oca.Space{number: 42, name: "Maze", player: nil, event: {:goto, 30} },
      %Oca.Space{number: 43, name: "", player: nil, event: {} },
      %Oca.Space{number: 44, name: "", player: nil, event: {} },
      %Oca.Space{number: 45, name: "Goose", player: nil, event: {:goose} },
      %Oca.Space{number: 46, name: "", player: nil, event: {} },
      %Oca.Space{number: 47, name: "", player: nil, event: {} },
      %Oca.Space{number: 48, name: "", player: nil, event: {} },
      %Oca.Space{number: 49, name: "", player: nil, event: {} },
      %Oca.Space{number: 50, name: "Goose", player: nil, event: {:goose} },
      %Oca.Space{number: 51, name: "", player: nil, event: {} },
      %Oca.Space{number: 52, name: "Prison", player: nil, event: {:lose, 1} },
      %Oca.Space{number: 53, name: "Go here if your roll 4 & 5 on the first roll", player: nil, event: {} },
      %Oca.Space{number: 54, name: "Goose", player: nil, event: {:goose} },
      %Oca.Space{number: 55, name: "", player: nil, event: {} },
      %Oca.Space{number: 56, name: "", player: nil, event: {} },
      %Oca.Space{number: 57, name: "", player: nil, event: {} },
      %Oca.Space{number: 58, name: "You died. Start over.", player: nil, event: {} },
      %Oca.Space{number: 59, name: "Goose", player: nil, event: {:goose} },
      %Oca.Space{number: 60, name: "", player: nil, event: {} },
      %Oca.Space{number: 61, name: "", player: nil, event: {} },
      %Oca.Space{number: 62, name: "", player: nil, event: {} },
      %Oca.Space{number: 63, name: "", player: nil, event: {} },
    ]
end
