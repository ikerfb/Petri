defmodule Example do
  def net do
    %{
      places: [:p0, :p1, :p2, :p3, :p4, :p5],
      transitions: [:A, :B, :C, :D, :E],
      flow: [
        {:p0, :A},
        {:A, :p1},
        {:A, :p2},
        {:p1, :B},
        {:p1, :D},
        {:p2, :C},
        {:p2, :D},
        {:B, :p3},
        {:C, :p4},
        {:D, :p3},
        {:D, :p4},
        {:p3, :E},
        {:p4, :E},
        {:E, :p5}
      ],
      marking: MapSet.new([:p0])
    }
  end

  def map_net do
    %{
      p0: MapSet.new([:A]),
      p1: MapSet.new([:B, :D]),
      p2: MapSet.new([:C, :D]),
      p3: MapSet.new([:E]),
      p4: MapSet.new([:E]),
      p5: MapSet.new([]),
      A: MapSet.new([:p1, :p2]),
      B: MapSet.new([:p3]),
      C: MapSet.new([:p4]),
      D: MapSet.new([:p3, :p4]),
      E: MapSet.new([:p5])
    }
  end
end
