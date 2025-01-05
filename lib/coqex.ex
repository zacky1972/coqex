defmodule Coqex do
  @moduledoc """
  Coqex: A Coq-Elixir binding.
  """

  @spec docker_executable() :: binary() | nil
  @doc """
  Returns Locates an executable of `docker` on the system.
  """
  def docker_executable() do
    System.find_executable("docker")
  end

  @spec docker_exists?() :: boolean()
  @doc """
  Returns `true` if `docker` is available.
  """
  def docker_exists?() do
    docker_executable()
    |> is_nil()
    |> Kernel.!()
  end

  @spec pull_coq() :: [binary()]
  @doc """
  Pulls Docker image of Coq.
  """
  def pull_coq() do
    if docker_exists?() do
      case System.cmd(docker_executable(), ["pull", "coqorg/coq:latest", "--quiet"], into: [], stderr_to_stdout: true) do
        {result, 0} -> Enum.map(result, &String.trim/1)
        {reason, _} -> raise RuntimeError, reason |> Enum.filter(&String.match?(&1, ~r/Cannot|Fail/)) |> Enum.join("\n")
      end
    else
      raise RuntimeError, "Docker is not avaiable."
    end
  end
end
