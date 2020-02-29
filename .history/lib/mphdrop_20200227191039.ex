defmodule MphDrop do
  def mph_drop() do
    drop_id = spawn(Drop, :drop, [])
    convert(drop_id)
  end

  def convert(drop_id) do
    receive do
      {planemo, distance} -> send(drop_id, {self(), planemo, distance})
        convert(drop_id)
      {planemo, distance, velocity} ->
        mph_velocity = 2.23693629 * velocity
        IO.write("On #{planemo}, a fall of #{distance} meters ")
        IO.puts("yields a velocity of #{mph_velocity} mph.")
        convert(drop_id)
    end

  end
end
