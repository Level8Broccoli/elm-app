module Main exposing (main)

import Entry
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit)


type alias Msg =
    { userInput : String }


initialModel : { entries : List String }
initialModel =
    { entries = [ "Erster Eintrag", "Zweiter Eintrag" ] }


handleUserInput : String -> Msg
handleUserInput i =
    { userInput = i }


newTodo : Html Msg
newTodo =
    Html.form []
        [ div [ class "field has-addons" ]
            [ div [ class "control is-expanded" ]
                [ input [ class "input", type_ "text", placeholder "Neuer Eintrag", onInput handleUserInput ] []
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
        ul [] (List.map Entry.entry list)


update msg model =
    model


main : Html Msg
main =
    div []
        [ section [ class "section" ]
            [ newTodo ]
        , section [ class "section" ]
            [ entryList initialModel.entries ]
        ]
