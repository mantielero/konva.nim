import jsffi
import shape

type
  RegularPolygonObj* {.importc:"Konva.RegularPolygon".} = ref object of ShapeObj
  RegularPolygon* = ref object of JsObject
    x*,y*,radius*:cdouble
    sides*:cint
    fill*,stroke*:cstring
    strokeWidth*:cint  
    shadowOffsetX*, shadowOffsetY*, shadowBlur*: cint
    opacity*: cdouble   

proc newRegularPolygon*(options:RegularPolygon):RegularPolygonObj {. importcpp: "new Konva.RegularPolygon(@)" .}
