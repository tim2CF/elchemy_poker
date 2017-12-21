
# Compiled using Elchemy v0.5.3
defmodule Models.Card do
  use Elchemy

  
  alias Ordering
  @type suit :: :hearts | :diamonds | :clubs | :spades

  @type value :: :v2 | :v3 | :v4 | :v5 | :v6 | :v7 | :v8 | :v9 | :v10 | :jack | :queen | :king | :ace

  @type card :: %{
    suit: suit,
    value: value
  }

  @spec suite_ordering() :: Ordering.ordering(suit)
  def suite_ordering() do
    Ordering.explicit([:hearts, :diamonds, :clubs, :spades])
  end

  @spec value_ordering() :: Ordering.ordering(value)
  def value_ordering() do
    Ordering.explicit([:v2, :v3, :v4, :v5, :v6, :v7, :v8, :v9, :v10, :jack, :queen, :king, :ace])
  end

end

