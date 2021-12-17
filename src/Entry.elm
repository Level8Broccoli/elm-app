module Entry exposing (entry)

import Html exposing (Html, button, div, i, input, label, li, span, text)
import Html.Attributes exposing (class, type_)


entry : String -> Html msg
entry entryLabel =
    li []
        [ div [ class "card mt-3" ]
            [ div [ class "header" ]
                [ label [ class "checkbox p-4" ]
                    [ input [ type_ "checkbox", class "m-1" ] []
                    , span [] [ text entryLabel ]
                    ]
                , button [ class "button is-danger m-4" ]
                    [ span [ class "icon" ]
                        [ i [ class "fas fa-trash" ] [] ]
                    ]
                ]
            ]
        ]
