import jsffi
import std/dom

type
  ShapeObj* {.importc:"Konva.Shape".} = ref object of JsObject
    zIndex*:proc(val:cint) {.closure.}
    on*: proc(evtStr:cstring; handler: proc(evt:Event)) {.closure.}# for events

  ContextObj* {.importc:"Konva.Context".} = ref object of JsObject
    beginPath*: proc() {.closure.}
    moveTo*: proc(x,y:cint) {.closure.}
    lineTo*: proc(x,y:cint) {.closure.}
    quadraticCurveTo*: proc(a,b,c,d:cint) {.closure.}
    closePath*: proc() {.closure.}
    # special Konva.js method
    fillStrokeShape*: proc(this:ShapeObj) {.closure.}     

  Shape* = ref object of JsObject
    fill*:cstring
    stroke*:cstring
    strokeWidth*:cint
    sceneFunc*:proc(context:ContextObj, this:ShapeObj)


proc newShape*(options:Shape):ShapeObj {. importcpp: "new Konva.Shape(@)" .}

# proc newShape*(sceneFunc: proc(context: JsObject; shape:ShapeObj); 
#                fill:string; 
#                stroke:string; 
#                strokeWidth:uint):ShapeObj =
#   var options = newJsObject()
#   options["sceneFunc"] = sceneFunc  
#   options["fill"] = fill.cstring
#   options["stroke"] = stroke.cstring  
#   options["strokeWidth"] = strokeWidth.cint


#[
type
  GroupObj* {.importc:"Konva.Group".} = ref object of ShapeObj
    #height* {.importc.}:cdouble

    add*:proc(tag:ShapeObj) {.closure.}
    width*:proc():cdouble  {.closure.}
    height*: proc():cdouble  {.closure.}    # getter
    setHeight*{.importc:"height".}:proc(val:cdouble)  {.closure.} # setter
    x*:proc():cdouble  {.closure.}      
    y*:proc():cdouble  {.closure.}

  Group* = ref object of JsObject
    x*,y*,width*,height*:cdouble
    draggable*:bool
]#