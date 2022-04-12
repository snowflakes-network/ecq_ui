defmodule ExqUI.MixProject do
  use Mix.Project

  def project do
    [
      app: :exq_ui,
      version: "0.13.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      docs: docs(),
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      mod: {ExqUI.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:exq, ">= 0.9.0"},
      {:phoenix_live_view, "~> 0.17.7"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:floki, ">= 0.30.0", only: :test},

      # docs
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      description: """
      Exq UI is the UI component for Exq, a job processing library.  Exq UI provides the UI dashboard
      to display stats on job processing.
      """,
      maintainers: ["Anantha Kumaran", "Alex Kira"],
      links: %{"GitHub" => "https://github.com/akira/exq_ui"},
      licenses: ["Apache2.0"],
      files:
        ~w(lib priv test assets/js assets/css assets/static) ++
          ~w(LICENSE mix.exs README.md CHANGELOG.md)
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"],
      dev: "run --no-halt dev.exs"
    ]
  end

  defp docs do
    [
      extras: ["CHANGELOG.md", "README.md"],
      main: "readme",
      formatters: ["html"]
    ]
  end
end
