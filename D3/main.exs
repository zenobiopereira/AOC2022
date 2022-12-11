defmodule AOC do
  def separator, do: IO.puts("----------")

  def split_in_half(str) do
    half = str |> String.length() |> div(2)
    str |> String.split_at(half)
  end

  def duplicated_occurencies(arg) do
    lst =
      if is_tuple(arg) do
        Tuple.to_list(arg)
      else
        arg
      end

    [head | tail] = lst |> Enum.map(&(String.graphemes(&1) |> MapSet.new()))
    tail |> Enum.reduce(head, &MapSet.intersection(&1, &2)) |> MapSet.to_list() |> hd
  end

  def codepoints(lst), do: (lst ++ [0]) |> Enum.map(&sum_of_priorities(&1)) |> Enum.sum()

  def sum_of_priorities(value) do
    cond do
      value == 0 -> 0
      value in 96..122 -> value - 96
      true -> value - 38
    end
  end

  def takeN(lst, n, acc) do
    tail = lst |> Enum.drop(n)
    head = lst |> Enum.take(n)

    cond do
      length(tail) > n -> takeN(tail, n, acc ++ [head])
      length(tail) == n -> acc ++ [head] ++ [tail]
      true -> acc
    end
  end

  def first_problem(str) do
    IO.puts("Part 1")

    str
    |> String.split()
    |> Enum.map(&(split_in_half(&1) |> duplicated_occurencies))
    |> Enum.join()
    |> to_charlist
    |> codepoints
    |> IO.puts()
  end

  def second_problem(str) do
    IO.puts("Part 2")

    str
    |> String.split()
    |> takeN(3, [])
    |> Enum.map(&duplicated_occurencies/1)
    |> Enum.join()
    |> to_charlist
    |> codepoints
    |> IO.puts()
  end

  def answers do
    {:ok, content} = File.read("input")

    first_problem(content)
    separator()
    second_problem(content)
  end
end

AOC.answers()
