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
end
