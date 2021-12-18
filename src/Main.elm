module Main exposing (main)

import Browser
import Debug
import Entry exposing (entry)
import Form exposing (newTodo)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Model, Msg(..))



-- MODEL


initialModel : Model
initialModel =
    { entries = [ "Erster Eintrag", "Zweiter Eintrag" ], currentValue = "" }



-- UPDATE


removeAtIndex : Int -> List a -> List a
removeAtIndex index list =
    if index < 0 || List.length list < index then
        list

    else if index == 0 then
        List.drop 1 list

    else
        let
            head =
                List.head list

            tail =
                Maybe.withDefault [] (List.tail list)
        in
        case head of
            Nothing ->
                list

            Just a ->
                a :: removeAtIndex (index - 1) tail


update : Msg -> Model -> Model
update msg model =
    let
        _ =
            Debug.log "Message" msg
    in
    case msg of
        UserInput input ->
            { model | currentValue = input }

        SubmitInput ->
            { model
                | entries = List.append model.entries [ model.currentValue ]
                , currentValue = ""
            }

        Error ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    section [ class "section" ]
        [ entryList model.entries
        , newTodo model.currentValue
        ]


entryList : List String -> Html Msg
entryList list =
    if List.isEmpty list then
        p [ class "is-italic has-text-grey-light has-text-centered" ] [ text "Liste ist leer" ]

    else
        ul [] (List.indexedMap entry list)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
