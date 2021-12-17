module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)


newTodo : Html msg
newTodo =
    Html.form []
        [ div [ class "field has-addons" ]
            [ div [ class "control is-expanded" ]
                [ input [ class "input", attribute "type" "text", placeholder "Neuer Eintrag" ] []
                ]
            , div [ class "control" ]
                [ a [ class "button is-danger" ] [ text "Erstellen" ]
                ]
            ]
        ]


entry : String -> Html msg
entry label =
    li []
        [ div [ class "card" ]
            [ div [ class "header" ]
                [ p [ class "card-header-title" ] [ text label ]
                ]
            ]
        ]


main : Html msg
main =
    div []
        [ section [ class "section" ]
            [ newTodo
            ]
        , section [ class "section" ]
            [ ul
                []
                [ entry "Test Eintrag"
                ]
            ]
        ]
