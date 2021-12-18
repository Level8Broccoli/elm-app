module Form exposing (newTodo)

import Html exposing (Html, button, div, hr, input, text)
import Html.Attributes exposing (class, placeholder, type_, value)
import Html.Events exposing (onInput, onSubmit)
import Types exposing (..)
import Html exposing (form)


handleUserInput : String -> Msg
handleUserInput value =
    UserInput value


handleSubmit : String -> Msg
handleSubmit currentUserInput =
    if String.length currentUserInput == 0 then
        Error

    else
        SubmitInput


newTodo : String -> Html Msg
newTodo currentValue =
    form [ onSubmit (handleSubmit currentValue), class "mt-5" ]
        [ hr [] []
        , div [ class "field has-addons" ]
            [ div [ class "control is-expanded" ]
                [ input [ class "input", type_ "text", placeholder "Neuer Eintrag", value currentValue, onInput handleUserInput ] []
                ]
            , div [ class "control" ]
                [ button [ class "button is-success", type_ "submit" ] [ text "Erstellen" ]
                ]
            ]
        ]
