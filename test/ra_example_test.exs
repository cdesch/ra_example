defmodule RaExampleTest do
  use ExUnit.Case
  doctest RaExample

  test "greets the world" do
    assert RaExample.hello() == :world
  end
end
