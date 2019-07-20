defmodule NutmegTest do
  use ExUnit.Case
  doctest Nutmeg

  test "greets the world" do
    assert Nutmeg.hello() == :world
  end
end
