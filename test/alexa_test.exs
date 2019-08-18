defmodule AlexaTest do
  use ExUnit.Case
  doctest Alexa

  test "greets the world" do
    assert Alexa.hello() == :world
  end
end
