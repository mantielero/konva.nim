import jsffi
import std/dom

type
  NodeObj* {.importc:"Konva.Shape".} = ref object of JsObject
    #zIndex*:proc(val:cint) {.closure.}
    on*: proc(evtStr:cstring; handler: proc(evt:Event)) {.closure.}# for events
    #x*: proc():cdouble {.closure.}
    #x*:proc():cdouble  {.closure.}      
    #y*:proc():cdouble  {.closure.}
    #width*:proc():cdouble  {.closure.}    
    #height*: proc():cdouble  {.closure.}    # getter
    #setHeight*{.importc:"height".}:proc(val:cdouble)  {.closure.} # setter

  # ContextObj* {.importc:"Konva.Context".} = ref object of JsObject
  #   beginPath*: proc() {.closure.}
  #   moveTo*: proc(x,y:cint) {.closure.}
  #   lineTo*: proc(x,y:cint) {.closure.}
  #   quadraticCurveTo*: proc(a,b,c,d:cint) {.closure.}
  #   closePath*: proc() {.closure.}
  #   # special Konva.js method
  #   fillStrokeShape*: proc(this:ShapeObj) {.closure.}     

  # Shape* = ref object of JsObject
  #   fill*:cstring
  #   stroke*:cstring
  #   strokeWidth*:cint
  #   sceneFunc*:proc(context:ContextObj, this:ShapeObj)

  ImageData* {.importc.} = ref object of JsObject