defmodule ElchemyPoker.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elchemy_poker,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      compilers: [:elchemy, :yecc, :leex, :erlang, :elixir, :app],
      elixirc_paths: ["lib", "elm-deps"],
      elchemy_path: "elm",
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ElchemyPoker.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:erlng, github: "timCF/erlng"},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
