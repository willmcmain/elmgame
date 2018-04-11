module Model exposing (..)

import Time exposing (Time)


type alias Vector2 a =
    { x: a
    , y: a
    }


toTuple : Vector2 a -> (a, a)
toTuple {x, y} = (x, y)

setX : a -> Vector2 a -> Vector2 a
setX x vector = { vector | x = x }

setY : a -> Vector2 a -> Vector2 a
setY y vector = { vector | y = y }


type alias Model = {
    position: Vector2 Float,
    velocity: Vector2 Float,
    dt: Time,
    ground: Float,
    onGround: Bool
    }


init : (Model, Cmd msg)
init = {
    position = Vector2 0 100,
    velocity = Vector2 0 0,
    dt = 0,
    ground = 100,
    onGround = False
    } ! []



gravity : Float
gravity = -1000.0


movePlayer : Time -> Model -> Model
movePlayer dt model =
    let
        groundY = model.ground + 50 - 384
        newY = (model.position.y + model.velocity.y * dt)
            |> clamp groundY 384
        onGround = newY == groundY

        newPosition = Vector2
            (model.position.x + model.velocity.x * dt)
            newY
        newVelocity = Vector2
            model.velocity.x
            (if onGround then 0 else model.velocity.y + gravity * dt)
    in
        { model |
            position = newPosition,
            velocity = newVelocity,
            onGround = onGround}