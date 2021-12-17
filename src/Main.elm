module Main exposing (main)

import Browser
import Debug
import Entry
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit)


type alias Msg =
    { description : String, data : String }


type alias Model =
    { entries : List String
    , currentValue : String
    }



-- MODEL


initialModel : Model
initialModel =
    { entries = [ "Erster Eintrag", "Zweiter Eintrag" ], currentValue = "" }



-- UPDATE


update : Msg -> Model -> Model
update msg model =
    let
        _ =
            Debug.log "Message" msg
    in
    if msg.description == "userInput" then
        { model | currentValue = msg.data }

    else
        { model | entries = List.append model.entries [ model.currentValue ], currentValue = "" }



-- VIEW


view : Model -> Html Msg
view model =
    section [ class "section" ]
        [ entryList model.entries
        , newTodo model.currentValue
        ]


handleUserInput : String -> Msg
handleUserInput value =
    { description = "userInput", data = value }


handleSubmit : Msg
handleSubmit =
    { description = "submitInput", data = "" }


newTodo : String -> Html Msg
newTodo currentValue =
    Html.form [ onSubmit handleSubmit, class "mt-5" ]
        [ hr [] []
        , div [ class "field has-addons" ]
            [ div [ class "control is-expanded" ]
                [ input [ class "input", type_ "text", placeholder "Neuer Eintrag", value currentValue, onInput handleUserInput ] []
                ]
            , div [ class "control" ]
                [ a [ class "button is-success" ] [ text "Erstellen" ]
                ]
            ]
        ]


entryList : List String -> Html msg
entryList list =
    if List.isEmpty list then
        text "Liste ist leer"

    else
        ul [] (List.map Entry.entry list)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
