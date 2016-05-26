defmodule Dijkstra do
  @doc """
  Examples:
    iex> Dijkstra.gcd(2, 8)
    2
    iex> Dijkstra.gcd(14, 21)
    7
    iex> Dijkstra.gcd(125, 46)
    1
    iex> Dijkstra.gcd(120, 36)
    12
  """
  def gcd(m, n) when m == n, do: m
  def gcd(m, n) when m <  n, do: gcd(n, m)
  def gcd(m, n) when m >  n, do: gcd(m-n, n)
end
