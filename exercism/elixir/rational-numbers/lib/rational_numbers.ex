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
    gcd = get_gcd(a0, a1)

    {div(a0, gcd), div(a1, gcd)} |> normalize()
  end

  @spec reduce(a :: rational) :: rational
  defp normalize({a, b}) when b < 0, do: {-a, -b}
  defp normalize(a), do: a

  defp get_gcd(0, second), do: second
  defp get_gcd(first, 0), do: first
  defp get_gcd(first, second), do: get_gcd(second, rem(first, second))

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
  def pow_rational({_, _}, n) when n == 0, do: {1, 1}
  def pow_rational({a0, a1}, n) when n < 0, do: pow_rational({a1, a0}, -n)
  def pow_rational({a0, a1}, n) do
    {pow_integer(a0, n), pow_integer(a1, n)} |> reduce()
  end

  defp pow_integer(a, 1), do: a
  defp pow_integer(a, n), do: a * pow_integer(a, n - 1)

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a0, a1}) do
    (x ** a0) ** (1.0/a1)
  end
end
