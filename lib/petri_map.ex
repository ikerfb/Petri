defmodule PetriMap do

  def preset(net, t) do
    net
    |> Enum.filter(fn {_k, v} -> MapSet.member?(v, t) end)
    |> Enum.map(fn {k, _} -> k end)
    |> MapSet.new()
  end

  def enablement(net, marking) do
    transitions =
      net
      |> Map.keys()
      |> Enum.filter(fn x -> Atom.to_string(x) =~ ~r/[A-Z]/ end)

    transitions
    |> Enum.filter(fn t ->
      pre = preset(net, t)
      MapSet.subset?(pre, marking)
    end)
    |> MapSet.new()
  end

end
