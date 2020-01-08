defmodule Oca.SpaceTest do
  use ExUnit.Case
  doctest Oca.Space

  test "A space contains a name, player, event" do
    space = %Oca.Space{}

    assert Map.has_key?(space, :name)
    assert Map.has_key?(space, :player)
    assert Map.has_key?(space, :event)
    assert Map.has_key?(space, :number)
  end
end
