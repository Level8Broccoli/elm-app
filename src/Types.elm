module Types exposing (..)


type alias Msg =
    { description : String, data : String }


type alias Model =
    { entries : List String
    , currentValue : String
    }
