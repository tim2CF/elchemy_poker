module ElchemyPoker.Utils exposing (shuffle, getVariations, groupBy)
import Elchemy exposing (ffi)
import List

shuffle : List a -> List a
shuffle =
  ffi "Erlng" "shuffle"

{-| Get list of variations.
Limitations: k >= 0, (List.length set) >= k
    getVariations 2 [ "a", "b" ] == Ok [["a","b"],["b","a"]]
-}

getVariations : Int -> List a -> Result String (List (List a))
getVariations k set =
  if k < 0 then
    Err <| "getVariations limitation: k >= 0, your k = " ++ toString k
  else if List.length set < k then
    Err <|
      "getVariations limitation: (List.length set) >= k, your set = "
        ++ toString set
        ++ " and your k = "
        ++ toString k
  else
    Ok (getVariations_ k set)

getVariations_ : Int -> List a -> List (List a)
getVariations_ k set =
  let
    doGetVariations k set depth resultItem =
      if depth < k then
        set
          |> List.concatMap
            (\setItem ->
              if List.member setItem resultItem then
                []
              else
                doGetVariations k set (depth + 1) (setItem :: resultItem)
            )
      else
        [ resultItem |> List.reverse ]
  in
  doGetVariations k set 0 []

splitBy : (a -> Bool) -> List a -> (List a, List a)
splitBy pred lst =
  let
    splitter el (acc1, acc2) =
      if pred el then
        (el :: acc1, acc2)
      else
        (acc1, el :: acc2)
  in
    List.foldl splitter ([], []) lst


groupBy : (a -> a -> Bool) -> List a -> List (List a)
groupBy eq lst =
  case lst of
    [] ->
      []
    x :: xs ->
      let
        (ys, zs) = splitBy (eq x) xs
      in
        (x :: ys) :: groupBy eq zs
