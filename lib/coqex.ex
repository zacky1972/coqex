defmodule Coqex do
  @moduledoc """
  Coqex: A Coq-Elixir binding.
  """

  @spec docker_exists?() :: boolean()
  @doc """
  Returns `true` if `docker` is available.
  """
  def docker_exists?() do
    System.find_executable("docker")
    |> is_nil()
    |> Kernel.!()
  end
end
