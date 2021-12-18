module Entry exposing (entry)

import Html exposing (Html, button, div, i, input, label, li, span, text)
import Html.Attributes exposing (class, type_)
import Html.Events exposing (onClick)
import Types exposing (Msg(..))


handleClick : Int -> Msg
handleClick index =
    DeleteEntry index


entry : Int -> String -> Html Msg
entry index entryLabel =
    li []
        [ div [ class "card mt-3" ]
            [ div [ class "header" ]
                [ label [ class "checkbox p-4" ]
                    [ input [ type_ "checkbox", class "m-1" ] []
                    , span [ class "px-2 has-text-weight-bold" ] [ text entryLabel ]
                    ]
                , button [ class "button is-danger m-4", onClick (handleClick index) ]
                    [ span [ class "icon" ]
                        [ i [ class "fas fa-trash" ] [] ]
                    ]
                ]
            ]
        ]
