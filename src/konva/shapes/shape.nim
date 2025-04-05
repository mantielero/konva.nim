# https://konvajs.org/api/Konva.Shape.html
import jsffi
import std/dom
import types 
#import ../common/templates

type
  ShapeObj* {.importc:"Konva.Shape".} = ref object of NodeObj
    #zIndex*:proc(val:cint) {.closure.}
    #on*: proc(evtStr:cstring; handler: proc(evt:Event)) {.closure.}# for events
    #x*: proc():cdouble {.closure.}
    #x*:proc():cdouble  {.closure.}      
    #y*:proc():cdouble  {.closure.}
    #width*:proc():cdouble  {.closure.}    
    #height*: proc():cdouble  {.closure.}    # getter
    #setHeight*{.importc:"height".}:proc(val:cdouble)  {.closure.} # setter

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
#proc newShape*(options:Shape):ShapeObj {. importcpp: "new Konva.Shape(@)" .}

template genAccessor(name: untyped, paramType: untyped) =
  #proc `name`*(self: ShapeObj): JsObject {.importcpp: "#." & astToStr(name) & "()".}
  proc `name`*(self: ShapeObj): paramType {.importcpp: "#." & astToStr(name) & "()".}
  proc `name`*(self: ShapeObj; value: paramType) {.importcpp: "#." & astToStr(name) & "(#)".}


template genGetter(name:untyped) =
  proc `name`*(self: ShapeObj): JsObject {.importcpp: "#." & astToStr(name) & "()".}

genGetter(getSelfRect)

genGetter(hasFill)

genGetter(hasShadow)

genGetter(hasStroke)

genAccessor(drawHitFromCache, cint)   # https://konvajs.org/api/Konva.Shape.html#drawHitFromCache

