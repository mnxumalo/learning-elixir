defmodule MphDrop do
  def mph_drop() do
    Process.flag(:trap_exit, true)
    drop_id = spawn_link(Drop, :drop, [])
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
      {:EXIT, pid, reason} ->
          IO.puts("Failure: #{inspect(pid)} #{inspect(reason)}")
    end

  end
end
