defmodule PhoenixAlexaTest do
  use ExUnit.Case
  doctest PhoenixAlexa

  test "greets the world" do
    assert PhoenixAlexa.hello() == :world
  end
end
