module View exposing (view)

import Html exposing (..)
import Model exposing (..)
import Collage exposing (..)
import Element exposing (toHtml)
import Color


width : number
width = 1024
height : number
height = 768


background : Model -> Form
background _ = filled
    (Color.rgb 0 255 255)
    (rect width height)


ground : Model -> Form
ground model = filled (Color.rgb 0 175 0) (rect width model.ground)
    |> moveY (-height / 2 + model.ground / 2)


player : Model -> Form
player model = filled (Color.rgb 200 0 0) (rect 50 100)
    |> move (toTuple model.position)


view : Model -> Html msg
view model = [background, ground, player]
    |> List.map ((|>) model)
    |> collage width height
    |> toHtml