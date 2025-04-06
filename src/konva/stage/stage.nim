# https://konvajs.org/api/Konva.Stage.html
import jsffi
import ../shapes/container
import ../layer/layer

type
  StageObj* {.importc:"Konva.Stage".} = ref object of ContainerObj
    setContainer*: proc(container:cstring) {.closure.}
    add*: proc(layer:LayerObj) {.closure.}   


# template genAccessor(name: untyped, paramType: untyped) =
#   #proc `name`*(self: ShapeObj): JsObject {.importcpp: "#." & astToStr(name) & "()".}
#   proc `name`*(self: StageObj): paramType {.importcpp: "#." & astToStr(name) & "()".}
#   proc `name`*(self: StageObj; value: paramType) {.importcpp: "#." & astToStr(name) & "(#)".}


# template genGetter(name:untyped) =
#   proc `name`*(self: StageObj): JsObject {.importcpp: "#." & astToStr(name) & "()".}


#template genSetter(name: untyped, paramType: untyped) =
#  proc `name`*(self: StageObj; value: paramType) {.importcpp: "#." & astToStr(name) & "(#)".}


proc newStage*(config:JsObject = nil): StageObj {. importcpp: "new Konva.Stage(#)" .}

proc newStage*(container:string; 
               width,height:int; 
               x:int = 0; y:int = 0; 
               scale:int = 1; scaleX:int = 1; scaleY:int = 1): StageObj =
  var config = newJsObject()
  config["container"] = container.cstring
  config["width"]     = width.cint
  config["height"]    = height.cint
  
  if x>=0:
    config["x"]    = x.cint
  if y>=0:
    config["y"]    = y.cint

  if scale != 1:
    config["scale"]    = scale.cint    
  if scaleX != 1:
    config["scaleX"]    = scaleX.cint
  if scaleY != 1:
    config["scaleY"]    = scaleY.cint

  return newStage(config)

  # genAccessor(setContainer, cstring)

  # genAccessor(height,cint)
  # genAccessor(width,cint)
