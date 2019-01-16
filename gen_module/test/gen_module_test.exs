defmodule GenModuleTest do
  use ExUnit.Case
  doctest GenModule

  test "greets the world" do
    assert GenModule.hello() == :world
  end
end
