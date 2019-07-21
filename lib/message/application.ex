defmodule Message.Application do
  use Application
  require Logger

  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      {Plug.Cowboy,
       scheme: :http, plug: Message.Router, options: [port: Application.get_env(:nutmeg, :port)]},
      worker(Mongo, [
        [name: :mongo, database: Application.get_env(:nutmeg, :mongo_db_name), pool_size: 2]
      ])
    ]

    opts = [strategy: :one_for_one, name: Nutmeg.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end
end
