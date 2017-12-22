
# Compiled using Elchemy v0.5.4
defmodule ElchemyPoker.Models.Deck do
  use Elchemy

  
  alias ElchemyPoker.Models.Card, as: Card
  alias ElchemyPoker.Utils, as: Utils

  #   TODO
  #   import ElchemyPoker.Models.Card as Card exposing (Card)
  #   is not working properly !!!

  @type deck :: list(Card.card)

  @spec new() :: deck
  def new() do
    (Card.suits
    |> (Elchemy.XList.map().(fn suit -> (Card.values
    |> (Elchemy.XList.map().(fn value -> {:card, suit, value} end)).()) end)).()
    |> (Elchemy.XList.concat).()
    |> (Utils.shuffle).())
  end

end

