# https://konvajs.org/api/Konva.Tag.html#main
import jsffi
import shape

type
  TagObj* {.importc:"Konva.Tag".} = ref object of ShapeObj
  Tag* = ref object of JsObject
    fill*:cstring
    pointerDirection*:cstring
    pointerWidth*: cint
    pointerHeight*: cint
    lineJoin*: cstring
    shadowColor*: cstring
    shadowBlur*: cint
    shadowOffsetX*: cint
    shadowOffsetY*: cint
    shadowOpacity*: cdouble

proc newTag*(options:Tag):TagObj {. importcpp: "new Konva.Tag(@)" .}

