defmodule Drop do

  def velocity({:earth, distance}) when distance >= 0 do
    :math.sqrt(9.8 * 2 * distance)
  end

  def velocity({:moon, distance}) when distance >= 0 do
    :math.sqrt(2 * 1.6 * distance)
  end

  def velocity({:mars, distance}) when distance >= 0 do
    :math.sqrt(2 * 3.71 * distance)
  end
end
