module Models.Card exposing (..)
import Ordering exposing (Ordering)

type Suit = Hearts | Diamonds | Clubs | Spades
type Value =  V2 | V3 | V4 | V5 | V6 | V7 | V8 | V9 | V10 | Jack | Queen | King | Ace

type alias Card = {suit: Suit, value: Value}

suiteOrdering : Ordering Suit
suiteOrdering =
    Ordering.explicit
      [Hearts, Diamonds, Clubs, Spades]

valueOrdering : Ordering Value
valueOrdering =
    Ordering.explicit
        [V2, V3, V4, V5, V6, V7, V8, V9, V10, Jack, Queen, King, Ace]
