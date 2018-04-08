module Message exposing (Message(..))

import Time exposing (Time)
import Keyboard exposing (KeyCode)

type Message 
    = TimeUpdate Time
    | KeyDown KeyCode
    | KeyUp KeyCode