defmodule Message.Model do
  @enforce_keys [:text, :username, :channel]
  defstruct(
    id: nil,
    text: nil,
    username: nil,
    channel: nil,
    time: nil
  )

  @type t() :: %__MODULE__{
          id: String.t() | nil,
          text: String.t(),
          username: String.t(),
          channel: String.t(),
          time: String.t() | nil
        }
end
