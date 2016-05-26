defmodule Geom do
  @moduledoc """
  Geometric calculations.
  """

  @doc """
  Using default dimensions of 1 for all dimensions,
  and assuming a rectangle, just return 1.

  Example:
    iex> Geom.area()
    1
  """
  def area(), do: 1

  @doc """
  Find the area of a shape with default values
    iex> Geom.area(7)
    7
  """
  def area(x)     when is_integer(x),  do: area(:rectangle, x, 1)
  def area(shape) when is_atom(shape), do: area(shape, 1, 1)

  @doc """
  Find the area of a shape.

  Example:
    iex> Geom.area(3,4)
    12
    iex> Geom.area(12, 7)
    84
    iex> Geom.area(7, 5)
    35
  """
  def area(shape, x) when is_atom(shape), do: area(shape, x, 1)
  def area(x, y)     when is_integer(x),  do: area(:rectangle, x, y)

  @doc """
    iex> Geom.area(:rectangle, 3, 4)
    12
  """
  def area(:rectangle, x, y), do: x * y

  @doc """
  Example:
    iex> Geom.area(:triangle, 3, 5)
    7.5
  """
  def area(:triangle, x, y), do: x * y / 2.0

  @doc """
  Example:
    iex> Geom.area(:ellipse, 2, 4)
    25.132741228718345
  """
  def area(:ellipse, x, y), do: :math.pi * x * y
end
