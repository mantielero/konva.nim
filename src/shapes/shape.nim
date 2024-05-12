import jsffi

type
  ShapeObj* {.importc:"Konva.Shape".} = ref object of JsObject
    zIndex*:proc(val:cint) {.closure.}

proc newShape*(options:JsObject):ShapeObj {. importcpp: "new Konva.Shape(@)" .}

proc newShape*(sceneFunc: proc(context: JsObject; shape:ShapeObj); 
               fill:string; 
               stroke:string; 
               strokeWidth:uint):ShapeObj =
  var options = newJsObject()
  options["sceneFunc"] = sceneFunc  
  options["fill"] = fill.cstring
  options["stroke"] = stroke.cstring  
  options["strokeWidth"] = strokeWidth.cint
