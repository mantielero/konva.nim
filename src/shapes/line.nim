# https://konvajs.org/api/Konva.Line.html
# https://konvajs.org/docs/shapes/Line_-_Simple_Line.html
import jsffi
import shape


type
  LineObj* {.importc:"Konva.Line".} = ref object of ShapeObj
    #add*:proc(tag:TagObj|TextObj) {.closure.}
    setPoints*{.importc:"points".}:proc(p:seq[cint]) {.closure.}
    points*{.importc:"points".}:proc() {.closure.}
  Line* = ref object of JsObject
    points*:seq[int]
    stroke*:cstring
    strokeWidth*:cint
    lineCap*:cstring
    lineJoin*:cstring


proc newLine*(options:Line):LineObj {. importcpp: "new Konva.Line(@)" .}