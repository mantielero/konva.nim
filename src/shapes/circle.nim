import jsffi
import shape

type
  CircleObj* {.importc:"Konva.Circle".} = ref object of ShapeObj
  Circle* = ref object of JsObject
    x*,y*,radius*:cdouble
    fill*,stroke*:cstring
    strokeWidth*:cint  

proc newCircle*(options:Circle):CircleObj {. importcpp: "new Konva.Circle(@)" .}

# proc newCircle*(x,y,radius:SomeNumber; fill:string; stroke:string; strokeWidth:int): CircleObj =
#   var options = newJsObject()
#   options["x"]       = 250#x.cdouble
#   options["y"]       = 250#y.cdouble
#   options["radius"]  = 70#radius.cdouble
#   options["fill"]    = "red".cstring#fill.cstring
#   options["stroke"]  = "black".cstring # stroke.cstring  
#   options["strokeWidth"]  = 4 # strokeWidth.cint  
#   return newCircle(options)
