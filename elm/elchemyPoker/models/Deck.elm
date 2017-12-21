module ElchemyPoker.Models.Deck exposing (..)
import ElchemyPoker.Models.Card as Card
import ElchemyPoker.Utils as Utils

{-
  TODO
  import ElchemyPoker.Models.Card as Card exposing (Card)
  is not working properly !!!
-}

type alias Deck = List Card.Card

new : Deck
new =
  Card.suits
  |> List.map (\suit ->
      Card.values
      |> List.map (\value -> Card.Card suit value))
  |> List.concat
  |> Utils.shuffle
