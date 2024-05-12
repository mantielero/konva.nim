import jsffi
import ../layer/layer

type
  StageObj* {.importc:"Konva.Stage".} = ref object of JsObject
    width*: proc():cint {.closure.}
    height*: proc():cint {.closure.}
    add*: proc(layer:LayerObj) {.closure.}   


proc newStage*(options:JsObject): StageObj {. importcpp: "new Konva.Stage(@)" .}

proc newStage*(container:string; width,height:int): StageObj =
  var options = newJsObject()
  options["container"] = container.cstring
  options["width"]     = width.cint
  options["height"]    = height.cint
  return newStage(options)