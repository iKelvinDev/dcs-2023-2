defmodule KelvinTest do
  use ExUnit.Case
  doctest Kelvin

  test "greets the world" do
    assert Kelvin.hello() == :world
  end
end
