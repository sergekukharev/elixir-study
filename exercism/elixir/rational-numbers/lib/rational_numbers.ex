defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a0, a1}, {b0, b1}) do
    {a0 * b1 + b0 * a1, a1 * b1} |> reduce()
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a0, a1}) do
    gcd = getGCD(a0, a1)

    {div(a0, gcd), div(a1, gcd)} |> normalize()
  end

  @spec reduce(a :: rational) :: rational
  defp normalize({a, b}) when b < 0, do: {a * -1, b * -1}
  defp normalize(a), do: a

  defp getGCD(0, second), do: second
  defp getGCD(first, 0), do: first
  defp getGCD(first, second), do: getGCD(second, rem(first, second))

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a0, a1}, {b0, b1}) do
    {a0 * b1 - b0 * a1, a1 * b1} |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a0, a1}, {b0, b1}) do
    {a0 * b0, a1 * b1} |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({num0, num1}, {div0, div1}) do
    {num0 * div1, num1 * div0} |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a0, a1}) do
    {Kernel.abs(a0), Kernel.abs(a1)} |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a0, a1}, n) when n == 0, do: {1, 1}
  def pow_rational({a0, a1}, n) when n < 0 do
    {pow_integer(a1, -n), pow_integer(a0, -n)} |> reduce()
  end
  def pow_rational({a0, a1}, n) do
    {pow_integer(a0, n), pow_integer(a1, n)} |> reduce()
  end

  defp pow_integer(a, 1), do: a
  defp pow_integer(a, n) do
    a * pow_integer(a, n - 1)
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
  end
end
