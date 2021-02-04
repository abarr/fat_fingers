defmodule FatFingers.Devices do

  def suggest(""), do: []

  def suggest(val) do
    Enum.filter(list(), fn d ->
      String.contains?(String.downcase(d), String.downcase(val)) end
      )
  end

  defp list() do
    [
      "Black",
      "Green",
      "Blue",
      "Pink",
      "Red",
      "Orange",
      "Purple"
    ]
  end

end
