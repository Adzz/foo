defmodule OTPAppTest do
  use ExUnit.Case
  doctest OTPApp

  test "greets the world" do
    assert OTPApp.hello() == :world
  end
end
