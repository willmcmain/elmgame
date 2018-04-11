module Update exposing (update)

import Message exposing (Message(..))
import Time exposing (Time)
import Model exposing (..)
import Keyboard exposing (KeyCode)
import Key exposing (..)

velocity : Float
velocity = 250

keyDown : KeyCode -> Model -> Model
keyDown keyCode model =
    case Key.fromCode keyCode of
        ArrowLeft ->
            { model | velocity = setX -velocity model.velocity }
        ArrowRight ->
            { model | velocity = setX velocity model.velocity }
        Space ->
            if model.onGround then
                { model | velocity = setY 500 model.velocity }
            else
                model
        _ -> model


keyUp : KeyCode -> Model -> Model
keyUp keyCode model =
    case Key.fromCode keyCode of
        ArrowLeft ->
            { model | velocity = setX 0 model.velocity }
        ArrowRight ->
            { model | velocity = setX 0 model.velocity }
        _ -> model


update : Message -> Model -> (Model, Cmd Message)
update msg model =
    case msg of
        TimeUpdate dt ->
            movePlayer (Time.inSeconds dt) { model | dt = dt } ! []
        KeyDown keyCode ->
            keyDown keyCode model ! []
        KeyUp keyCode ->
            keyUp keyCode model ! []        
