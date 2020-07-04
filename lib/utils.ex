defmodule ExConstructor.Utils do
  @doc """
    Attempts first to use an existing atom rathen than creating a new one.
    Avoids a potential DDoS attack on the BEAM.

    https://engineering.klarna.com/monitoring-erlang-atoms-c1d6a741328e
  """
  def to_existing_atom(string) do
    try do
      String.to_existing_atom(string)
    rescue
      _e in ArgumentError -> String.to_atom(string)
    end
  end
end
