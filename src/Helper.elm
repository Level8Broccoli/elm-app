module Helper exposing (..)


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
