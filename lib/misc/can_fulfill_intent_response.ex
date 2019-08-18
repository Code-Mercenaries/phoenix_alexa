defmodule Alexa.CanFulfillIntentResponse do
  alias Alexa.{CanFulfillIntentResponse}
  alias Alexa.{CanFulfillIntent}

  defstruct version: "1.0",
            response: %{}

  def set_can_fulfill_intent(response, %CanFulfillIntent{} = canfulfill) do
    %CanFulfillIntentResponse{
      response
      | response: response.response |> Map.put(:canFulfillIntent, canfulfill)
    }
  end
end
