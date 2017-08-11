defmodule Device.Library.Mixfile do
  use Mix.Project

  def project do
    [app: :device_library,
     version: "0.1.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:resource_discovery, git: "https://github.com/titan/resource_discovery.git", branch: "master"},
      {:domainlib, git: "git@github.com:titan/logistics-domain-library.git", branch: "master" },
      {:ex_doc, "~> 0.11", only: :dev}
    ]
  end
end
