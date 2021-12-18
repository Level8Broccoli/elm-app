module Types exposing (..)


type Msg
    = UserInput String
    | SubmitInput
    | DeleteEntry Int
    | Error


type alias Model =
    { entries : List String
    , currentValue : String
    }
