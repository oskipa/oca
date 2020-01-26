defmodule Oca.Player do
  @moduledoc """
  Documentation for Oca.Player.
  """

  @doc """
  Player struct 

  ## Examples

      iex> %Oca.Player{}
      %Oca.Player{money: 100, name: ""}

  """
  defstruct name: "", money: 100, lost_turns: 0

  @doc """
  Updates lost_turns

  Returns %Oca.Player{}

  ## Parameters
    - player, %Oca.Player{}, the player struct to update
    - turns,  Integer,       the number of turns lost 

  ## Examples

        iex> Oca.Player.set_lost_turns(%Oca.Player{}, 2) 
        %Oca.Player{name: "", money: 100, lost_turns: 2}
  """
  def set_lost_turns(player, turns) do
    %{player | lost_turns: turns}
  end 

end
