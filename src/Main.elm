module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)


initialModel : { entries : List String }
initialModel =
    { entries = [ "Erster Eintrag", "Zweiter Eintrag" ] }


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


entryList : List String -> Html msg
entryList list =
    if List.isEmpty list then
        text "Liste ist leer"

    else
        ul
            []
            (List.map
                entry
                initialModel.entries
            )


entry : String -> Html msg
entry label =
    li []
        [ div [ class "card mt-3" ]
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
            [ entryList initialModel.entries ]
        ]
