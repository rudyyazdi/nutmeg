defmodule Message.Repo do
  @collection_name "messages"

  @spec all_messages :: {:ok, list(Message.Model.t())} | {:error, String}
  def all_messages do
    messages =
      Mongo.find(:mongo, @collection_name, %{}, limit: 20)
      |> Enum.to_list()

    {:ok, messages}
  end

  @spec add_message(Message.Model.t()) :: {:ok, Message.Model.t()} | {:error, Mongo.Error}
  def add_message(message) do
    result = Mongo.insert_one(:mongo, @collection_name, message)

    case result do
      {:ok, %Mongo.InsertOneResult{inserted_id: id}} ->
        %{
          "channel" => channel,
          "text" => text,
          "time" => time,
          "username" => username
        } = Mongo.find_one(:mongo, @collection_name, %{_id: id})

        {:ok,
         %Message.Model{
           channel: channel,
           id: id,
           text: text,
           time: time,
           username: username
         }}

      _ ->
        {:error, result}
    end
  end

  @spec find_message(String) :: {:ok, Message.Model.t()} | {:error, String}
  def find_message(id) do
    {:ok, %Message.Model{text: "fr", username: "fr", channel: "chan"}}
  end
end
