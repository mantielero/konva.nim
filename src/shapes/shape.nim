import jsffi
import std/dom
#import ../common/templates

type
  ShapeObj* {.importc:"Konva.Shape".} = ref object of JsObject
    #zIndex*:proc(val:cint) {.closure.}
    on*: proc(evtStr:cstring; handler: proc(evt:Event)) {.closure.}# for events
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

proc newShape*(options:Shape):ShapeObj {. importcpp: "new Konva.Shape()" .}
#proc newShape*(options:Shape):ShapeObj {. importcpp: "new Konva.Shape(@)" .}

template genAccessor(name: untyped, paramType: untyped) =
  proc `name`*(self: ShapeObj): JsObject {.importcpp: "#." & astToStr(name) & "()".}
  proc `name`*(self: ShapeObj; value: paramType) {.importcpp: "#." & astToStr(name) & "(#)".}


proc addName*(self:ShapeObj; value:cstring) {.importcpp:"#.addName(#)".}

genAccessor(alpha, cfloat)  # 0..1

genAccessor(blue, cint)     # 0..255

genAccessor(blurRadius, cint)   

genAccessor(brightness, cint)   

genAccessor(contrast, cint)  

genAccessor(dragDistance, cint)  

genAccessor(draggable, bool)  

genAccessor(height, cfloat)

genAccessor(name, cstring)

genAccessor(offsetX, cint)

genAccessor(offsetY, cint)

genAccessor(width, cfloat)

genAccessor(x, cfloat)

genAccessor(y, cfloat)

genAccessor(zIndex, cint)

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

#[
absolutePosition(pos)

cache( [config])
clearCache()
clone(obj)

dash(dash)
dash(dash)
dashEnabled(enabled)
destroy()
dragBoundFunc(dragBoundFunc)

draw()
drawHitFromCache(alphaThreshold)
embossBlend(embossBlend)
embossDirection(embossDirection)
embossStrength(level)
embossWhiteLevel(embossWhiteLevel)
enhance(amount)
fill(color)
fillAfterStrokeEnabled(fillAfterStrokeEnabled)
fillEnabled(enabled)
fillLinearGradientColorStops(colorStops)
fillLinearGradientEndPoint(endPoint)
fillLinearGradientEndPointX(x)
fillLinearGradientEndPointY(y)
fillLinearGradientStartPoint(startPoint)
fillLinearGradientStartPointX(x)
fillLinearGradientStartPointY(y)
fillPatternImage(image)
fillPatternOffset(offset)
fillPatternOffsetX(x)
fillPatternOffsetY(y)
fillPatternRepeat(repeat)
fillPatternRotation(rotation)
fillPatternScale(scale)
fillPatternScaleX(x)
fillPatternScaleY(y)
fillPatternX(x)
fillPatternY(y)
fillPriority(priority)
fillRadialGradientColorStops(colorStops)
fillRadialGradientEndPoint(endPoint)
fillRadialGradientEndPointX(x)
fillRadialGradientEndPointY(y)
fillRadialGradientEndRadius(radius)
fillRadialGradientStartPoint(startPoint)
fillRadialGradientStartPointX(x)
fillRadialGradientStartPointY(y)
fillRadialGradientStartRadius(radius)
fillRule(rotation)
filters(filters)
findAncestor(selector [, includeSelf] [, stopNode])
findAncestors(selector [, includeSelf] [, stopNode])
fire(eventType [, evt] [, bubble])
getAbsoluteOpacity()
getAbsolutePosition(Ancestor)
getAbsoluteRotation()
getAbsoluteScale()
getAbsoluteTransform()
getAbsoluteZIndex()
getAncestors()
getAttr(attr)
getAttrs()
getClassName()
getClientRect(config)
getDepth()
getLayer()
getParent()
getRelativePointerPosition()
getSelfRect()
getStage()
getTransform()
getType()
globalCompositeOperation(type)
green(green)
hasFill()
hasName(name)
hasShadow()
hasStroke()
height(height)
hide()
hitFunc(drawFunc)
hitStrokeWidth(hitStrokeWidth)
hue(hue)
id(id)
intersects(point)
isCached()
isClientRectOnScreen(margin)
isDragging()
isListening()
isVisible()
kaleidoscopeAngle(degrees)
kaleidoscopePower(power)
levels(level)
linearLinearGradientStartPointX(x)
lineCap(lineCap)
lineJoin(lineJoin)
listening(listening)
luminance(value)
move(change)
moveDown()
moveTo(newContainer)
moveToBottom()
moveToTop()
moveUp()
name(name)
noise(noise)
off(evtStr)

on(evtStr, handler)
opacity(opacity)
perfectDrawEnabled(perfectDrawEnabled)
pixelSize(pixelSize)
position(pos)
preventDefault(preventDefault)
red(red)
remove()
removeName(name)
rotate(theta)
rotation(rotation)
saturation(saturation)
scale(scale)
scaleX(x)
scaleY(y)
sceneFunc(drawFunc)
setAttr(attr, val)
setAttrs(config)
shadowBlur(blur)
shadowColor(color)
shadowEnabled(enabled)
shadowForStrokeEnabled(shadowForStrokeEnabled)
shadowOffset(offset)
shadowOffsetX(x)
shadowOffsetY(y)
shadowOpacity(opacity)
show()
size(size)
skew(skew)
skewX(x)
skewY(y)
startDrag()
stopDrag()
stroke(color)
strokeEnabled(enabled)
strokeHitEnabled(strokeHitEnabled)
strokeLinearGradientColorStops(colorStops)
strokeLinearGradientEndPoint(endPoint)
strokeLinearGradientEndPointX(x)
strokeLinearGradientEndPointY(y)
strokeLinearGradientStartPoint(startPoint)
strokeLinearGradientStartPointY(y)
strokeScaleEnabled(enabled)
strokeWidth(strokeWidth)
threshold(threshold)
to( [params])
toBlob(config)
toCanvas(config)
toDataURL(config)
toImage(config)
toJSON()
toObject()
transformsEnabled(enabled)
value(value)
visible(visible)


]#