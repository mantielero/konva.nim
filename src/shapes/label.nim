# https://konvajs.org/api/Konva.Label.html
import jsffi
import shape
import tag, text

type
  LabelObj* {.importc:"Konva.Label".} = ref object of ShapeObj
    add*:proc(tag:TagObj|TextObj) {.closure.}
  LabelOptions* = ref object of JsObject
    x*:int
    y*:int
    opacity*:float


proc newLabel*(options:LabelOptions):LabelObj {. importcpp: "new Konva.Label(@)" .}


