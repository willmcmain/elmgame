module Elmgame exposing (main)

import Html exposing (program)
import AnimationFrame
import Keyboard
import View
import Model exposing (Model)
import Message exposing (Message(..))
import Update

main : Program Never Model Message
main = program {
    init = Model.init,
    view = View.view,
    update = Update.update,
    subscriptions = subscriptions
    }


subscriptions : Model -> Sub Message
subscriptions model =
    Sub.batch [ 
        AnimationFrame.diffs TimeUpdate,
        Keyboard.downs KeyDown,
        Keyboard.ups KeyUp
        ]