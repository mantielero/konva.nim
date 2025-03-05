# https://konvajs.org/api/Konva.Text.html
import jsffi
import shape
#import ../common/templates

type
  TextObj* {.importc:"Konva.Text".} = ref object of ShapeObj
    #text*:cstring #{.importcpp:"#".}  #proc():cstring {.closure.}
    #text*{.importc.}:JsObject #{..}
    #text*:proc(txt:cstring) {.closure.}
    #text*:proc() {.closure.}

    #x*:proc(x:cint) {.closure.}   
    #y*:proc(y:cint) {.closure.}           
    #offsetX*:proc(offset:cint) {.closure.}
    offsetY*:proc(offset:cint) {.closure.}

    # width*:proc():cint {.closure.}
    # height*:proc():cint {.closure.}

  # Text* = ref object of JsObject
  #   x*:cdouble
  #   y*:cdouble
  #   text*:cstring
  #   fontFamily*:cstring
  #   fontSize*:cint
  #   padding*:cint
  #   fill*:cstring
  #   align*:cstring

proc newText*():TextObj {.importcpp:"new Konva.Text()".}

template genAccessor(name: untyped, paramType: untyped) =
  proc `name`*(self: TextObj): JsObject {.importcpp: "#." & astToStr(name) & "()".}
  proc `name`*(self: TextObj; value: paramType) {.importcpp: "#." & astToStr(name) & "(#)".}

#proc newText*(options:JsObject):TextObj {.importcpp:"new Konva.Text(@)".}

# template genAccessor(name: untyped, paramType: untyped) =
#   proc `name`*(self: TextObj): JsObject {.importcpp: "#." & astToStr(name) & "()".}
#   proc `name`*(self: TextObj; value: paramType) {.importcpp: "#." & astToStr(name) & "(#)".}





genAccessor(align, cstring) # 'left', 'center', 'right' or 'justify'



genAccessor(direction, cstring)  # "rtl"





# https://konvajs.org/api/Konva.Text.html#name__anchor


# https://konvajs.org/api/Konva.Text.html#text__anchor
genAccessor(text, cstring)


proc heightAuto*(self:TextObj) {.importcpp:"""#.height("auto")""".}

proc widthAuto*(self:TextObj) {.importcpp:"""#.width("auto")""".}

genAccessor(wrap, cstring)  # "word", "char", "none"





#[
- [ ] _shouldHandleEllipsis(currentHeightPx)
- [ ] ellipsis(ellipsis)
- [ ] fontFamily(fontFamily)
- [ ] fontSize(fontSize)
- [ ] fontStyle(fontStyle)
- [ ] fontVariant(fontVariant)
- [ ] getTextWidth()
- [ ] letterSpacing(letterSpacing)
- [ ] lineHeight(lineHeight)
- [ ] measureSize(text)
- [ ] padding(padding)
- [ ] textDecoration(textDecoration)
- [ ] verticalAlign(verticalAlign)

]#





#[
- [ ] _shouldHandleEllipsis(currentHeightPx)
- [ ] absolutePosition(pos)

- [ ] cache( [config])
- [ ] clearCache()
- [ ] clone(obj)
- [ ] contrast(contrast)
- [ ] dash(dash)
- [ ] dashEnabled(enabled)
- [ ] destroy()

- [ ] dragBoundFunc(dragBoundFunc)

- [ ] draw()
- [ ] drawHitFromCache(alphaThreshold)
- [ ] ellipsis(ellipsis)
- [ ] embossBlend(embossBlend)
- [ ] embossDirection(embossDirection)
- [ ] embossStrength(level)
- [ ] embossWhiteLevel(embossWhiteLevel)
- [ ] enhance(amount)
- [ ] fill(color)
- [ ] fillAfterStrokeEnabled(fillAfterStrokeEnabled)
- [ ] fillEnabled(enabled)
- [ ] fillLinearGradientColorStops(colorStops)
- [ ] fillLinearGradientEndPoint(endPoint)
- [ ] fillLinearGradientEndPointX(x)
- [ ] fillLinearGradientEndPointY(y)
- [ ] fillLinearGradientStartPoint(startPoint)
- [ ] fillLinearGradientStartPointX(x)
- [ ] fillLinearGradientStartPointY(y)
- [ ] fillPatternImage(image)
- [ ] fillPatternOffset(offset)
- [ ] fillPatternOffsetX(x)
- [ ] fillPatternOffsetY(y)
- [ ] fillPatternRepeat(repeat)
- [ ] fillPatternRotation(rotation)
- [ ] fillPatternScale(scale)
- [ ] fillPatternScaleX(x)
- [ ] fillPatternScaleY(y)
- [ ] fillPatternX(x)
- [ ] fillPatternY(y)
- [ ] fillPriority(priority)
- [ ] fillRadialGradientColorStops(colorStops)
- [ ] fillRadialGradientEndPoint(endPoint)
- [ ] fillRadialGradientEndPointX(x)
- [ ] fillRadialGradientEndPointY(y)
- [ ] fillRadialGradientEndRadius(radius)
- [ ] fillRadialGradientStartPoint(startPoint)
- [ ] fillRadialGradientStartPointX(x)
- [ ] fillRadialGradientStartPointY(y)
- [ ] fillRadialGradientStartRadius(radius)
- [ ] fillRule(rotation)
- [ ] filters(filters)
- [ ] findAncestor(selector [, includeSelf] [, stopNode])
- [ ] findAncestors(selector [, includeSelf] [, stopNode])
- [ ] fire(eventType [, evt] [, bubble])
- [ ] fontFamily(fontFamily)
- [ ] fontSize(fontSize)
- [ ] fontStyle(fontStyle)
- [ ] fontVariant(fontVariant)
- [ ] getAbsoluteOpacity()
- [ ] getAbsolutePosition(Ancestor)
- [ ] getAbsoluteRotation()
- [ ] getAbsoluteScale()
- [ ] getAbsoluteTransform()
- [ ] getAbsoluteZIndex()
- [ ] getAncestors()
- [ ] getAttr(attr)
- [ ] getAttrs()
- [ ] getClassName()
- [ ] getClientRect(config)
- [ ] getDepth()
- [ ] getLayer()
- [ ] getParent()
- [ ] getRelativePointerPosition()
- [ ] getSelfRect()
- [ ] getStage()
- [ ] getTextWidth()
- [ ] getTransform()
- [ ] getType()
- [ ] globalCompositeOperation(type)
- [ ] green(green)
- [ ] hasFill()
- [ ] hasName(name)
- [ ] hasShadow()
- [ ] hasStroke()
- [ ] height(height)
- [ ] hide()
- [ ] hitFunc(drawFunc)
- [ ] hitStrokeWidth(hitStrokeWidth)
- [ ] hue(hue)
- [ ] id(id)
- [ ] intersects(point)
- [ ] isCached()
- [ ] isClientRectOnScreen(margin)
- [ ] isDragging()
- [ ] isListening()
- [ ] isVisible()
- [ ] kaleidoscopeAngle(degrees)
- [ ] kaleidoscopePower(power)
- [ ] letterSpacing(letterSpacing)
- [ ] levels(level)
- [ ] linearLinearGradientStartPointX(x)
- [ ] lineCap(lineCap)
- [ ] lineHeight(lineHeight)
- [ ] lineJoin(lineJoin)
- [ ] listening(listening)
- [ ] luminance(value)
- [ ] measureSize(text)
- [ ] move(change)
- [ ] moveDown()
- [ ] moveTo(newContainer)
- [ ] moveToBottom()
- [ ] moveToTop()
- [ ] moveUp()

- [ ] noise(noise)
- [ ] off(evtStr)

- [ ] on(evtStr, handler)
- [ ] opacity(opacity)
- [ ] padding(padding)
- [ ] perfectDrawEnabled(perfectDrawEnabled)
- [ ] pixelSize(pixelSize)
- [ ] position(pos)
- [ ] preventDefault(preventDefault)
- [ ] red(red)
- [ ] remove()
- [ ] removeName(name)
- [ ] rotate(theta)
- [ ] rotation(rotation)
- [ ] saturation(saturation)
- [ ] scale(scale)
- [ ] scaleX(x)
- [ ] scaleY(y)
- [ ] sceneFunc(drawFunc)
- [ ] setAttr(attr, val)
- [ ] setAttrs(config)
- [ ] shadowBlur(blur)
- [ ] shadowColor(color)
- [ ] shadowEnabled(enabled)
- [ ] shadowForStrokeEnabled(shadowForStrokeEnabled)
- [ ] shadowOffset(offset)
- [ ] shadowOffsetX(x)
- [ ] shadowOffsetY(y)
- [ ] shadowOpacity(opacity)
- [ ] show()
- [ ] size(size)
- [ ] skew(skew)
- [ ] skewX(x)
- [ ] skewY(y)
- [ ] startDrag()
- [ ] stopDrag()
- [ ] stroke(color)
- [ ] strokeEnabled(enabled)
- [ ] strokeHitEnabled(strokeHitEnabled)
- [ ] strokeLinearGradientColorStops(colorStops)
- [ ] strokeLinearGradientEndPoint(endPoint)
- [ ] strokeLinearGradientEndPointX(x)
- [ ] strokeLinearGradientEndPointY(y)
- [ ] strokeLinearGradientStartPoint(startPoint)
- [ ] strokeLinearGradientStartPointY(y)
- [ ] strokeScaleEnabled(enabled)
- [ ] strokeWidth(strokeWidth)

- [ ] textDecoration(textDecoration)
- [ ] threshold(threshold)
- [ ] to( [params])
- [ ] toBlob(config)
- [ ] toCanvas(config)
- [ ] toDataURL(config)
- [ ] toImage(config)
- [ ] toJSON()
- [ ] toObject()
- [ ] transformsEnabled(enabled)
- [ ] value(value)
- [ ] verticalAlign(verticalAlign)
- [ ] visible(visible)

- [ ] wrap(wrap)

]#