defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {elem(a, 0) * elem(b, 1) + elem(b, 0) * elem(a, 1), elem(a, 1) * elem(b, 1)}
      |> reduce()
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    gcd = getGCD(a)

    {div(elem(a, 0), gcd), div(elem(a, 1), gcd)} |> normalize()
  end

  @spec reduce(a :: rational) :: rational
  def normalize({a, b}) when b < 0 do
    {a * -1, b * -1}
  end
  def normalize(a), do: a

  @spec getGCD(num :: rational) :: integer
  defp getGCD(num) do
    first = elem(num, 0)
    second = elem(num, 1)
    getGCD(first, second)
  end

  @spec getGCD(0, second :: integer) :: integer
  defp getGCD(0, second), do: second

  @spec getGCD(first :: integer, 0) :: integer
  defp getGCD(first, 0), do: first

  @spec getGCD(first :: integer, second :: integer) :: integer
  defp getGCD(first, second) do
    getGCD(second, rem(first, second))
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
  end
end
