# https://konvajs.org/api/Konva.Rect.html
# https://konvajs.org/docs/shapes/Rect.html#sidebar
import jsffi
import shape

type
  RectObj* {.importc:"Konva.Rect".} = ref object of ShapeObj
  Rect* = ref object of JsObject
    x*,y*,width*,height*: cdouble
    fill*:cstring
    stroke*:cstring
    strokeWidth*:cdouble
    cornerRadius*:cdouble
    shadowColor*:cstring
    shadowBlur*:cint
    shadowOffsetX*:cint
    shadownOffsetY*:cint
    shadowOpacity*:cdouble



proc newRect*(options:Rect):RectObj {. importcpp: "new Konva.Rect(@)" .}

# proc newRect*(x,y,width,height:SomeNumber; fill:string; 
#               stroke:string = "black"; 
#               strokeWidth:uint = 0;
#               cornerRadius:uint = 0;
#               cornerRadiusSeq:seq[int] = @[];
#               shadowColor:string = "";
#               shadowBlur:uint = 0;
#               shadowOffsetX:int = 0;
#               shadowOffsetY:int = 0;              
#               shadowOpacity:float = 0.0              
#               ):RectObj =
#   var options = newJsObject()
#   options["x"]       = x.cdouble
#   options["y"]       = y.cdouble
#   options["width"]  = width.cdouble
#   options["height"]  = height.cdouble  
#   options["fill"]    = fill.cstring
#   options["stroke"]  = stroke.cstring  
#   options["strokeWidth"]  = strokeWidth.cint  
#   options["shadowBlur"]  = shadowBlur.cint 
#   if cornerRadius > 0: 
#     options["cornerRadius"]  = cornerRadius.cint    
#   elif cornerRadiusSeq != @[]:
#     options["cornerRadius"]  = cornerRadiusSeq 
#   if shadowColor != "":
#     options["shadowColor"]  = shadowColor.cstring        
#   if shadowBlur > 0:
#     options["shadowBlur"]  = shadowBlur.cint
#   if shadowOffsetX != 0:
#     options["shadowOffsetX"]  = shadowOffsetX.cint  
#   if shadowOffsetY != 0:
#     options["shadowOffsetY"]  = shadowOffsetY.cint  
#   if shadowOpacity != 0:
#     options["shadowOpacity"]  = shadowOpacity.cdouble           
#   return newRect(options)


