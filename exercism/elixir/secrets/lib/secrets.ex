defmodule Secrets do
  require Integer

  def secret_add(secret) do
    fn another ->
      secret + another
    end
  end

  def secret_subtract(secret), do: &(&1 - secret)

  def secret_multiply(secret), do: &(secret * &1)

  def secret_divide(secret), do: &(div(&1, secret))

  def secret_and(secret) do
    fn another ->
      Bitwise.band(another, secret)
    end
  end

  def secret_xor(secret) do
    fn another ->
      Bitwise.bxor(another, secret)
    end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn value ->
      secret_function1.(value) |> secret_function2.()
    end
  end
end
