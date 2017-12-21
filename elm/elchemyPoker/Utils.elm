module ElchemyPoker.Utils exposing (..)
import Elchemy exposing (ffi)

shuffle : List a -> List a
shuffle =
  ffi "Erlng" "shuffle"
