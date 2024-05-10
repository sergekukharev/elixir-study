defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * (100 - discount) / 100
  end

  def monthly_rate(hourly_rate, discount) do
    ceil(22 * daily_rate(apply_discount(hourly_rate, discount)))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    day_rate = apply_discount(hourly_rate, discount) |> daily_rate
    Float.floor(budget / day_rate, 1)
  end
end
