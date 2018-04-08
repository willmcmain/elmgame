module Model exposing (..)

import Time exposing (Time)


type alias Pos a =
    { x: a
    , y: a
    }


toTuple : Pos a -> (a, a)
toTuple {x, y} = (x, y)


type alias Model = {
    position: Pos Float,
    velocity: Float,
    dt: Time,
    ground: Float
    }


init : (Model, Cmd msg)
init = {
    position = Pos 0 0,
    velocity = 0,
    dt = 0,
    ground = 100
    } ! []