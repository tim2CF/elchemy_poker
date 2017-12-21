module ElchemyPoker.Utils exposing (shuffle, getVariations)
import Elchemy exposing (ffi)

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
