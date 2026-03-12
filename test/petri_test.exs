defmodule PetriTest do
  use ExUnit.Case

  test "A esta habilitada al inicio" do
    net = Example.net()
    assert Petri.enabled?(net, :A)
  end

  test "A mueve la ficha a p1 y p2" do
    net = Example.net()
    net = Petri.fire(net, :A)
    assert net[:marking] == MapSet.new([:p1, :p2])
  end

  test "enablement con p1 y p4 da B" do
    net = Example.net()
    marking = MapSet.new([:p1, :p4])

    assert Petri.enablement(net, marking) == MapSet.new([:B])
  end

  test "enablement con p1 y p2 da B C D" do
    net = Example.net()
    marking = MapSet.new([:p1, :p2])

    assert Petri.enablement(net, marking) == MapSet.new([:B, :C, :D])
  end

  test "enablement map version p1 p4 -> B" do
    net = Example.map_net()
    marking = MapSet.new([:p1, :p4])

    assert PetriMap.enablement(net, marking) == MapSet.new([:B])
  end

  test "enablement map version p1 p2 -> B C D" do
    net = Example.map_net()
    marking = MapSet.new([:p1, :p2])

    assert PetriMap.enablement(net, marking) == MapSet.new([:B, :C, :D])
  end
end
