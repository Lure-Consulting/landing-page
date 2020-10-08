defmodule LearnElixirLanding.MixProject do
  use Mix.Project

  def project do
    [
      app: :learn_elixir_landing,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      default_release: :learn_elixir_landing,
      releases: [
        learn_elixir_landing: [
          include_executables_for: [:unix],
          steps: [:assemble, :tar],
          applications: [learn_elixir_landing: :permanent, runtime_tools: :permanent]
        ]
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {LearnElixirLanding.Application, []},
      extra_applications: [:logger, :runtime_tools, :os_mon]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.1"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_ecto, "~> 4.1"},
      {:phoenix_live_view, "~> 0.13.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_dashboard, "~> 0.2.0"},

      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},

      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},

      {:plug_cowboy, "~> 2.0"},

      {:timex, "~> 3.6"},

      {:gen_smtp, "~> 0.15"},
      {:hackney, "~> 1.9"},
      {:earmark, "~> 1.4"},
      {:swoosh, "~> 1.0"},

      {:ecto_sql, "~> 3.4"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"]
    ]
  end
end
