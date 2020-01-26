defmodule Oca.Rules do
  @moduledoc """
  
  """  
  @doc """
  Moves the player to the new position

  ## Params
  - game, %Oca.Game{}, the game state
  - player, %Oca.Player{}, the player we are moving
  - position, Integer, the new position on the board

  ## Returns
  %Oca.Game{}, the new board state
  """
  def goto(game, player, position) do
    positions = %{ game.board.player_positions | player.name => position }
    # implement this tomorrow
    # game = update_player(game, player) 
    %{game | board: %{game.board | player_positions: positions}}
  end

end
