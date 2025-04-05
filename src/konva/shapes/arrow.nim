# https://konvajs.org/api/Konva.Arrow.html
# https://konvajs.org/docs/shapes/Arrow.html#sidebar

import jsffi
import shape

type
  ArrowObj* {.importc:"Konva.Arrow".} = ref object of ShapeObj
    #add*:proc(tag:TagObj|TextObj) {.closure.}
  Arrow* = ref object of JsObject
    points*:seq[cint]
    tension*:cint #= 0
    pointerLength*:cint #= 10
    pointerWidth*:cint  #= 10
    pointerAtBeginning*:bool = false
    pointerAtEnding*:bool = false
    fill*:cstring

    stroke*:cstring
    strokeWidth*:cint

proc newArrow*(options: Arrow):ArrowObj {. importcpp: "new Konva.Arrow(@)" .}