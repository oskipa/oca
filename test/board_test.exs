defmodule Oca.BoardTest do
  use ExUnit.Case
  doctest Oca.Board

  test "creates a board with 63 spaces" do
    board = %Oca.Board{}
    assert Enum.count(board.spaces) == 63
  end

end
