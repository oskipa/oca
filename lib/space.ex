defmodule Oca.Space do
  @moduledoc """
  Documentation for Oca.Space
  """

  @doc """
  Creates a new Space

  ## Description
  The space is at the heart of the Game of the Goose. It often has a name, and it can have a special event if you land on it.

  """
  defstruct number: 1, name: "", player: "", event: {:action}
end
