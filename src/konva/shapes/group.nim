# https://konvajs.org/api/Konva.Group.html
import jsffi
import container, shape
# import tag, text

type
  GroupObj* {.importc:"Konva.Group".} = ref object of ContainerObj
    #height* {.importc.}:cdouble

    add*:proc(tag:ShapeObj) {.closure.}
    # width*:proc():cdouble  {.closure.}
    # height*: proc():cdouble  {.closure.}    # getter
    # setHeight*{.importc:"height".}:proc(val:cdouble)  {.closure.} # setter
    # x*:proc():cdouble  {.closure.}      
    # y*:proc():cdouble  {.closure.}

  Group* = ref object of JsObject
    x*,y*,width*,height*:cdouble
    draggable*:bool


proc newGroup*(options:Group):GroupObj {. importcpp: "new Konva.Group(@)" .} 