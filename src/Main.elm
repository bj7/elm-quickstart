import Html exposing (Html, button, div, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)

main : Program Never Model Msg
main = 
    Html.beginnerProgram { model = model, view = view, update = update }

-- Model

type alias Model = Int

model : Model
model = 
    0

-- Update

type Msg = Increment | Decrement | Reset

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1    
        
        Reset ->
            0
-- View

myStyle : Html.Attribute msg
myStyle = 
    style [
        ("display", "inline")
    ]

view: Model -> Html Msg
view model =
    div []
        [
            button [onClick Decrement, myStyle][text "-"],
            div [myStyle] [text (toString model)],
            button [onClick Increment, myStyle] [text "+"],
            button [onClick Reset][text "Reset"]
        ]
