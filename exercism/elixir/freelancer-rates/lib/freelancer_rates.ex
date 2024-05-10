defmodule FreelancerRates do
  @daily_working_hours 8.0
  @monthly_billable_days 22.0

  def daily_rate(hourly_rate) do
    hourly_rate * @daily_working_hours
  end

  def apply_discount(before_discount, discount) do
    before_discount * (100 - discount) / 100
  end

  def monthly_rate(hourly_rate, discount) do
    apply_discount(hourly_rate, discount)
      |> daily_rate()
      |> Kernel.*(@monthly_billable_days)
      |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    day_rate = apply_discount(hourly_rate, discount)
      |> daily_rate()
      |> (&(budget / &1)).()
      |> Float.floor(1)
  end
end
