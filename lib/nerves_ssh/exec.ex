defmodule NervesSSH.Exec do
  @moduledoc """
  This module contains helper methods for running commands over SSH
  """

  @doc """
  Run one Elixir command coming over ssh
  """
  @spec run_elixir(charlist()) :: {:ok, binary()} | {:error, binary()}
  def run_elixir(cmd) do
    {result, _env} = Code.eval_string(to_string(cmd))
    {:ok, inspect(result)}
  catch
    kind, value ->
      {:error, "** (#{kind}) #{inspect(value)}"}
  end
end
