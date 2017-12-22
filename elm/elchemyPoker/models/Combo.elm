module ElchemyPoker.Models.Combo exposing (calculate)
import ElchemyPoker.Models.Card as Card
import ElchemyPoker.Utils as Utils

type alias Power = List Card.Value
type Combo =
  RoyalFlash          |
  StraightFlash Power |
  FourOfKind    Power |
  FullHouse     Power |
  Flush         Power |
  Straight      Power |
  ThreeOfKind   Power |
  TwoPairs      Power |
  OnePair       Power |
  HighCard      Power

handLength  = 7
comboLength = 5

calculate : List Card.Card -> Result String Combo
calculate cards =
  let
    cardsAmount = List.length cards
  in
  if cardsAmount == handLength then
    case Utils.getVariations comboLength cards of
      Ok variations -> Ok <| calculate_ variations
      Err error     -> Err error
  else
    Err <|
      "texas holdem rules require "
      ++ toString handLength
      ++ " cards in hand to calculate wincombo, was given "
      ++ toString cardsAmount

{-

  TODO
  continue to implement this function

-}
calculate_ : List (List (Card.Card)) -> Combo
calculate_ variations =
  let
    foo = variations
          |> List.map (\cards ->
              cards
              |> Utils.groupBy (\card1 card2 ->
                  card1.value == card2.value))
          |> Debug.log "hello"
  in
  RoyalFlash
