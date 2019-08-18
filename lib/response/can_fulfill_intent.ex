defmodule Alexa.CanFulfillIntent do
  alias Alexa.CanFulfillIntent

  defstruct type: "CanFulfillIntent",
            canFulfill: "",
            slots: %{}

  def set_can_fulfill(card, can_fulfill) do
    %CanFulfillIntent{card | canFulfill: can_fulfill}
  end

  def set_content(card, slots) do
    %CanFulfillIntent{card | slots: slots}
  end
end
