defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 and not legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and not legacy? -> :fatal
      true -> :unknown
      nil -> :unknown
      false -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    code = to_label(level, legacy?)

    cond do
      code == :error or code == :fatal -> :ops
      code == :unknown and legacy? -> :dev1
      code == :unknown and not legacy? -> :dev2
      true -> false
    end
  end
end
