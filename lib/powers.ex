defmodule Powers do
  @doc """
  Calculate x to the nth power.

  Renamed from raise because overriding methods seems silly.

  Examples:
    iex> Powers.pow(5,1)
    5
    iex> Powers.pow(2,3)
    8
    iex> Powers.pow(1.2, 3)
    1.728
    iex> Powers.pow(2, 0)
    1
    iex> Powers.pow(2, -3)
    0.125
  """
  def pow(_, 0), do: 1
  def pow(x, 1), do: x
  def pow(x, n) when n > 1, do: pow(x, n, 1)
  def pow(x, n) when n < 0, do: 1.0 / pow(x, -n)

  def pow(_, 0, acc), do: acc
  def pow(x, n, acc), do: pow(x, n-1, x * acc)

  @doc """
  Finds the nth root of a number, where n is an integer.

  Example:
    iex> Powers.nth_root(27, 3)
    3.0
    iex> Powers.nth_root(81, 2)
    9.0
    iex> Powers.nth_root(64, 3)
    4.0
  """
  def nth_root(x, n) do
    nth_root(x, n, x / 2.0)
  end

  def nth_root(x, n, a) do
    f = pow(a,n) - x
    f_prime = n * pow(a, n-1)
    change = f/f_prime
    next = a - change

    if change < 1.0e-8 do
      next
    else
      nth_root(x, n, next)
    end
  end

  # reduces a stream of answers
  def new_nth_root(x,n) do
    nth_root_answer_stream(x, n)
    |> Enum.reduce_while(x, fn (next, prev) ->
      if abs(prev - next) > 1.0e-8, do: {:cont, next}, else: {:halt, next}
    end)
  end

  # streams increasingly better solutions for nth_root
  def nth_root_answer_stream(x,n) do
    Stream.unfold(x/2.0, fn a ->
      f = pow(a,n) - x
      f_prime = n * pow(a, n-1)
      {a, a - f/f_prime} # return {previous value, new value}
    end)
  end
end
