module HTML exposing (main)

import Html exposing (..)
import Html.Attributes exposing (class, style)


main =
    div []
        [ h1 [] [ text "Elm HTML Demo" ]
        , p [class "paragraph"] [text "paragraph ..."]
        ]
