defmodule Alexa.MixProject do
  use Mix.Project

  @version File.read!("VERSION") |> String.strip()

  def project do
    [
      app: :alexa,
      version: @version,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 4.0"},
      {:plug, "~> 1.8"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package do
    [
      files: ~w(lib test mix.exs README.md LICENSE VERSION),
      maintainers: [""],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/"}
    ]
  end
end
