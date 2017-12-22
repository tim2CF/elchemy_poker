
# Compiled using Elchemy v0.5.4
defmodule ElchemyPoker.Models.Card do
  use Elchemy

  
  #  import Ordering exposing (Ordering) 
  @type suit :: :hearts | :diamonds | :clubs | :spades

  @type value :: :v2 | :v3 | :v4 | :v5 | :v6 | :v7 | :v8 | :v9 | :v10 | :jack | :queen | :king | :ace

  @type card :: %{
    suit: suit,
    value: value
  }

  @spec suits() :: list(suit)
  def suits() do
    [:hearts, :diamonds, :clubs, :spades]
  end

  @spec values() :: list(value)
  def values() do
    [:v2, :v3, :v4, :v5, :v6, :v7, :v8, :v9, :v10, :jack, :queen, :king, :ace]
  end



  # suiteOrdering : Ordering Suit
  # suiteOrdering =
  #     Ordering.explicit
  #       [Hearts, Diamonds, Clubs, Spades]

  # valueOrdering : Ordering Value
  # valueOrdering =
  #     Ordering.explicit
  #         [V2, V3, V4, V5, V6, V7, V8, V9, V10, Jack, Queen, King, Ace]


end

