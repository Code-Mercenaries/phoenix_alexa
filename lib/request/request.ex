defmodule Alexa.Request do
  alias Alexa.{Session, GenericRequest}

  defstruct version: "",
            session: %Session{},
            request: %GenericRequest{}
end
