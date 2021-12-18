module Types exposing (..)


type Msg
    = UserInput String
    | SubmitInput
    | Error


type alias Model =
    { entries : List String
    , currentValue : String
    }
