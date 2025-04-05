import jsffi
import std/dom
import ../filters/filters
#import ../common/templates

import types

proc newNode*(config:JsObject = nil):NodeObj {. importcpp: "new Konva.Node(@)" .}
  ## Node constructor. Nodes are entities that can be transformed, layered, and have bound events. The stage, layers, groups, and shapes all extend Node.

#proc newShape*(options:Shape):ShapeObj {. importcpp: "new Konva.Shape(@)" .}

template genAccessor(name: untyped, paramType: untyped) =
  #proc `name`*(self: ShapeObj): JsObject {.importcpp: "#." & astToStr(name) & "()".}
  proc `name`*(self: NodeObj): paramType {.importcpp: "#." & astToStr(name) & "()".}
  proc `name`*(self: NodeObj; value: paramType) {.importcpp: "#." & astToStr(name) & "(#)".}


template genGetter(name:untyped) =
  proc `name`*(self: NodeObj): JsObject {.importcpp: "#." & astToStr(name) & "()".}


#proc filters*(self:NodeObj; val: seq[proc()]) {.importcpp: "#.filters(#)".}

#proc filters*(obj: JsObject, filters: openArray[JsObject]) {.importcpp.}
#type
#  FilterType {.importcpp:"Konva.Node.Filter".} = proc (self: NodeObj; imageData: ImageData) 

type
  FilterType* = proc(self: NodeObj; imageData: ImageData) # {.importc:"Kanva.Filter".} 
  BlurType* {.importc:"Kanva.Filter.Blur".} = FilterType

#proc filters*(obj: NodeObj, filters: seq[proc (self: NodeObj; imageData: ImageData)]) {.importcpp:"#.filters(#)".}
#proc filters*(obj: NodeObj, filters: openarray[proc (self: NodeObj; imageData: ImageData)]) {.importcpp:"#.filters(#)".}
#proc filters*(obj: NodeObj; filters: openArray[FilterType]) {.importcpp:"#.filters(#)".}
proc filters*(obj: NodeObj; filters: FilterType) {.importcpp:"#.filters(@)".}

#proc blur*(self:NodeObj; imageData: ImageData)  {.importcpp: "Konva.Filters.Blur".}  # WORKS
proc blur*(self:NodeObj; imageData: ImageData)  {.importcpp: "Konva.Filters.Blur(@)".}  # NOT WORKING



genAccessor(blue, cint)     # 0..255

genAccessor(blurRadius, cint)   

genGetter(clearCache)

proc cache*(self: NodeObj) {.importcpp: "#.cache()".}

#genAccessor(cache, JsObject)     # TODO: To clarify what is the config.

genAccessor(contrast, cint)

genGetter(destroy)

genAccessor(dragDistance, cint)  

genAccessor(draggable, bool)  

genGetter(draw)

genGetter(isCached)

genAccessor(addName, cstring)     
# proc addName*(self:ShapeObj; value:cstring) {.importcpp:"#.addName(#)".}


genAccessor(alpha, cfloat)  # 0..1

genAccessor(brightness, cint)

genGetter(getAncestors)

genGetter(getAbsoluteOpacity)

genGetter(getAbsoluteRotation)

genGetter(getAbsoluteScale)

genGetter(getAbsoluteTransform)

genGetter(getAbsoluteZIndex)

genGetter(getAttrs)

genGetter(getClassName)

genGetter(getDepth)

genGetter(getLayer)

genGetter(getParent)

genGetter(getRelativePointerPosition)

genGetter(getStage)

genGetter(getTransform)

genGetter(getType)

genAccessor(height, cfloat)

genGetter(hide)

genGetter(isDragging)

genGetter(isListening)

genGetter(isVisible)

genGetter(moveDown)

genGetter(moveUp)

genGetter(moveToBottom)

genGetter(moveToTop)

genAccessor(name, cstring)

genAccessor(offsetX, cint)

genAccessor(offsetY, cint)

genGetter(startDrag)

genGetter(stopDrag)

genAccessor(width, cfloat)

genAccessor(x, cfloat)

genAccessor(y, cfloat)

genAccessor(zIndex, cint)

#---------------






