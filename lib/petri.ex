defmodule Petri do
  def preset(net, t) do
    net.flow
    |> Enum.filter(fn {a, b} -> b == t end)
    |> Enum.map(fn {a, _} -> a end)
    |> MapSet.new()
  end

  def postset(net, t) do
    net.flow
    |> Enum.filter(fn {a, b} -> a == t end)
    |> Enum.map(fn {_, b} -> b end)
    |> MapSet.new()
  end

  def enabled?(net, t) do
    pre = preset(net, t)
    MapSet.subset?(pre, net.marking)
  end

  def fire(net, t) do
    if enabled?(net, t) do
      pre = preset(net, t)
      post = postset(net, t)

      new_marking =
        net.marking
        |> MapSet.difference(pre)
        |> MapSet.union(post)

      %{net | marking: new_marking}
    else
      :error
    end
  end
end
