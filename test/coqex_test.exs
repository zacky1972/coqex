defmodule CoqexTest do
  use ExUnit.Case
  doctest Coqex

  test "greets the world" do
    assert Coqex.hello() == :world
  end
end
