defmodule Alexa.CanFulfillIntentRequest do
  alias Alexa.Intent

  defstruct type: "CanFulfillIntentRequest",
            requestId: "",
            timestamp: "",
            intent: %Intent{}
end
