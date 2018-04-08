module Update exposing (update)

import Message exposing (Message(..))
import Time exposing (Time)
import Model exposing (Model)
import Keyboard exposing (KeyCode)
import Key exposing (..)


velocity : Float
velocity = 0.5


applyPhysics : Time -> Model -> Model
applyPhysics dt model = 
    let 
        oldPosition = model.position
        newPosition = {oldPosition | x = oldPosition.x + model.velocity * dt}
    in
        { model | position = newPosition }


keyDown : KeyCode -> Model -> Model
keyDown keyCode model =
    case Key.fromCode keyCode of
        ArrowLeft ->
            { model | velocity = -velocity}
        ArrowRight ->
            { model | velocity = velocity}
        _ -> model


keyUp : KeyCode -> Model -> Model
keyUp keyCode model =
    case Key.fromCode keyCode of
        ArrowLeft ->
            { model | velocity = 0}
        ArrowRight ->
            { model | velocity = 0}
        _ -> model


update : Message -> Model -> (Model, Cmd Message)
update msg model =
    case msg of
        TimeUpdate dt ->
            applyPhysics dt { model | dt = dt } ! []
        KeyDown keyCode ->
            keyDown keyCode model ! []
        KeyUp keyCode ->
            keyUp keyCode model ! []        
