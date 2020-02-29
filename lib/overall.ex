defmodule Overall do
    def product([]) do
        0
    end
    def product(list) do
        product(list, 1)
    end

    defp product([head | tail], accumulator) do
        product(tail, head * accumulator)
    end

    defp product([], accumulator) do
        accumulator
    end
end