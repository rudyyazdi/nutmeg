defmodule Nutmeg.MixProject do
  use Mix.Project

  def project do
    [
      app: :nutmeg,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Message.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 3.1"},
      {:mongodb, "~> 0.4.9"},
      {:poolboy, "~> 1.5.2"}
    ]
  end
end
