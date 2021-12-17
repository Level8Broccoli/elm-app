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
                [ input [ class "input", type_ "text", placeholder "Neuer Eintrag" ] []
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
            (List.map entry list)


entry : String -> Html msg
entry entryLabel =
    li []
        [ div [ class "card mt-3" ]
            [ div [ class "header" ]
                [ label [ class "checkbox p-4" ]
                    [ input [ type_ "checkbox", class "m-1" ] []
                    , span [] [ text entryLabel ]
                    ]
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
