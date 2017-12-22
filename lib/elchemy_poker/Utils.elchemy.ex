
# Compiled using Elchemy v0.5.4
defmodule ElchemyPoker.Utils do
  use Elchemy

  
  import Elchemy, only: []
  alias Elchemy.XList
  @spec shuffle(list(any)) :: list(any)
  curry shuffle/1
  verify as: Erlng.shuffle/1
  def shuffle(a1), do: Erlng.shuffle(a1)
  @moduledoc """
  Get list of variations.
  Limitations: k >= 0, (List.length set) >= k
      iex> import ElchemyPoker.Utils
      iex> get_variations(2, ["a", "b"])
      {:ok, [["a", "b"], ["b", "a"]]}

  
  """
  @spec get_variations(integer, list(any)) :: Elchemy.XResult.result(String.t, list(list(any)))
  curry get_variations/2
  def get_variations(k, set) do
    cond do
      (k < 0) -> (("getVariations limitation: k >= 0, your k = " ++ to_string().(k))
        |> (fn x1 -> {:error, x1} end).())
      (Elchemy.XList.length(set) < k) -> (("getVariations limitation: (List.length set) >= k, your set = " ++ (to_string().(set) ++ (" and your k = " ++ to_string().(k))))
        |> (fn x1 -> {:error, x1} end).())
      true -> {:ok, get_variations_(k, set)}
    end
  end

  @spec get_variations_(integer, list(any)) :: list(list(any))
  curry get_variations_/2
  defp get_variations_(k, set) do
    do_get_variations = rec do_get_variations, fn k -> fn set -> fn depth -> fn result_item -> if (depth < k) do (set
    |> (Elchemy.XList.concat_map().(fn set_item -> if Elchemy.XList.member(set_item, result_item) do [] else do_get_variations.(k).(set).((depth + 1)).([set_item | result_item]) end end)).()) else [(result_item
    |> (Elchemy.XList.reverse).())] end end end end end
    do_get_variations.(k).(set).(0).([])
  end

  @spec split_by((any -> boolean), list(any)) :: {list(any), list(any)}
  curry split_by/2
  defp split_by(pred, lst) do
    splitter = rec splitter, fn el -> fn {acc1, acc2} -> if pred.(el) do {[el | acc1], acc2} else {acc1, [el | acc2]} end end end
    Elchemy.XList.foldl(splitter, {[], []}, lst)
  end

  @spec group_by((any -> (any -> boolean)), list(any)) :: list(list(any))
  curry group_by/2, lambdas: [{0, 2}]
  def group_by(eq, lst) do
    case lst do
      [] ->
        []
      [x | xs] ->
        {ys, zs} = split_by(eq.(x), xs)
        [[x | ys] | group_by(eq, zs)]
    end
  end

end

