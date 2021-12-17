# elm-app

## Counter example

Start server with

```sh
elm reactor
```

And Elm will start a server on which you can try out the Elm code directly. Navigate to `http://localhost:8000/src/Counter.elm` to play with the Counter example.

## Web App example

Start web server with the [Live Server Extension](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer).

Compile the Elm code with

```sh
elm make src/Main.elm --output=dist/elm.js
```
