import konva
import std/dom, jsconsole

# https://konvajs.org/docs/overview.html#basic-shapes

proc createTriangle(context: ContextObj; shape:ShapeObj) =
    context.beginPath()
    context.moveTo(20, 50)
    context.lineTo(220, 80)
    context.quadraticCurveTo(150, 100, 260, 170)
    context.closePath()
    context.fillStrokeShape(shape)

proc main =
  var stage = newStage("container", 500, 500)
  var layer = newLayer()
  var triangle = newShape(
                            Shape(
                            fill: "#00D2FF",#.cstring, 
                            stroke: "black",#.cstring, 
                            strokeWidth: 4,
                            sceneFunc: createTriangle ) 
                            )
  layer.add(triangle)  # add the shape to the layer
  
  stage.add(layer)   # add the layer to the stage
  layer.draw()

main()
