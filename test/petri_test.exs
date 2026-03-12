defmodule PetriTest do
  use ExUnit.Case

  test "A esta habilitada al inicio" do
    net = Example.net()
    assert Petri.enabled?(net, :A)
  end

  test "A mueve la ficha a p1 y p2" do
    net = Example.net()

    net = Petri.fire(net, :A)

    assert net.marking == MapSet.new([:p1, :p2])
  end
end
