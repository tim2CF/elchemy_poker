
# Compiled using Elchemy v0.5.4
defmodule ElchemyPoker.Models.Combo do
  use Elchemy

  
  alias ElchemyPoker.Models.Card, as: Card
  alias ElchemyPoker.Utils, as: Utils
  @type power :: list(Card.value)

  @type combo :: :royal_flash | {:straight_flash, power} | {:four_of_kind, power} | {:full_house, power} | {:flush, power} | {:straight, power} | {:three_of_kind, power} | {:two_pairs, power} | {:one_pair, power} | {:high_card, power}

  defp hand_length() do
    7
  end

  defp combo_length() do
    5
  end

  @spec calculate(list(Card.card)) :: Elchemy.XResult.result(String.t, combo)
  curry calculate/1
  def calculate(cards) do
    cards_amount = Elchemy.XList.length(cards)
    if (cards_amount == hand_length()) do case Utils.get_variations().(combo_length()).(cards) do
      {:ok, variations} ->
        (calculate_(variations)
        |> (fn x1 -> {:ok, x1} end).())
      {:error, error} ->
        {:error, error}
    end else (("texas holdem rules require " ++ (to_string().(hand_length()) ++ (" cards in hand to calculate wincombo, was given " ++ to_string().(cards_amount))))
    |> (fn x1 -> {:error, x1} end).()) end
  end



  #   TODO
  #   continue to implement this function


  @spec calculate_(list(list(Card.card))) :: combo
  curry calculate_/1
  defp calculate_(variations) do
    foo = (variations
    |> (Elchemy.XList.map().(fn cards -> (cards
    |> (Utils.group_by().(fn card1 -> fn card2 -> (card1.value == card2.value) end end)).()) end)).()
    |> (Elchemy.XDebug.log().("hello")).())
    :royal_flash
  end

end

