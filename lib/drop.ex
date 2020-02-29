defmodule Drop do

  def drop() do
    receive do
      {from, planemo, distance} -> send(from, {planemo, distance, velocity({planemo, distance})})
    end
    drop()
  end

  defp velocity({:earth, distance}) when distance >= 0 do
    :math.sqrt(9.8 * 2 * distance)
  end

  defp velocity({:moon, distance}) when distance >= 0 do
    :math.sqrt(2 * 1.6 * distance)
  end

  defp velocity({:mars, distance}) when distance >= 0 do
    :math.sqrt(2 * 3.71 * distance)
  end
end
