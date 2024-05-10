defmodule LogLevel do
  def to_label(level, true) do
    cond do
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      true -> :unknown
      nil -> :unknown
      false -> :unknown
    end
  end

  def to_label(level, false) do
    cond do
      level == 0 -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 -> :fatal
      true -> :unknown
      nil -> :unknown
      false -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    code = to_label(level, legacy?)

    cond do
      code == :error -> :ops
      code == :fatal -> :ops
      code == :unknown -> cond do
        legacy? == true -> :dev1
        legacy? == false -> :dev2
      end
      true -> false
    end
  end
end
