# Alexa

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `alexa` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:alexa, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/alexa](https://hexdocs.pm/alexa).


Update a route with a post request into your alexa controller. 

```elixir
  scope "/", HelloAlexa do
    pipe_through :api

    post "/", AlexaController, :post
  end

```

In the controller add a use statement for `Alexa.Controller` and define functions for `launch_request`, `session_end_request` and `intent_request` as follows:

```elixir

defmodule HelloAlexa.AlexaController do
  use HelloAlexa.Web, :controller
  use Alexa.Controller, :post  # param should match route name

  def launch_request(conn, request) do
    response = %Response{} 
        |> set_output_speech(%TextOutputSpeech{text: "Welcome to the Horoscope."}) 

    conn
      |> set_response(response)
  end

  def session_end_request(conn, request) do
    conn
  end

  def intent_request(conn, "GetHoroscope", request) do
    response = case request.request.intent.slots["Sign"]["value"] do
      "Libra" ->
        card = %SimpleCard{}
          |> set_title("Get Horoscope")
          |> set_content("You are going to have an unexpected event today.")

        %Response{} 
          |> set_output_speech(%TextOutputSpeech{text: "You are going to have an unexpected event today."}) 
          |> set_card(card)
          |> set_session_attributes(%{my_key: "my_data"})
          |> set_should_end_session(true)
      _ ->
        %Response{} 
          |> set_output_speech(%TextOutputSpeech{text: "You are going to meet an interesting person."}) 
          |> set_should_end_session(true)
    end

    conn |> set_response(response)
  end
end

```

To authenticate that the request corresponds to your Alexa application add the ValidateApplicationId plug to your router as follows:

```elixir
  pipeline :api do
    plug :accepts, ["json"]
    plug ValidateApplicationId, "amzn1.echo-sdk-ams.app.05dcb1a4-cb45-46c5-a30e-bb3033a0770a"
  end
```
