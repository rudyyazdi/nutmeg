defmodule Message.Repo do
  @spec all_messages :: {:ok, list(Message.Model.t())} | {:error, String}
  def all_messages do
    {:ok, [%Message.Model{text: "fr", username: "fr", channel: "chan"}]}
  end

  @spec add_message(Message.Model.t()) :: {:ok, Message.Model.t()} | {:error, String}
  def add_message(message) do
    {:ok, message}
  end

  @spec find_message(String) :: {:ok, Message.Model.t()} | {:error, String}
  def find_message(id) do
    {:ok, %Message.Model{text: "fr", username: "fr", channel: "chan"}}
  end
end
