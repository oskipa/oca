defmodule Oca.Dice do
  @moduledoc """
  Documentation for Oca.Dice
  """

  @doc """
  Rolls 2d6 dice

  Returns `{dice_1, dice_2}`

  ## Examples
        
        Oca.Dice.roll()
        {3, 4}

  """
  def roll() do
    { Enum.random(1..6), Enum.random(1..6)} 
  end
end
