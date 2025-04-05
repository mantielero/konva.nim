import konva
import std/dom, jsconsole

# https://konvajs.org/docs/overview.html#how-does-it-work

proc main =
  var stage = newStage("container", 500, 500)
  var layer = newLayer()
  var circle = newCircle(Circle(x: (stage.width()/2).float, 
                                y: (stage.height()/2), 
                                radius: 70,
                                fill: "red", 
                                stroke: "black", 
                                strokeWidth: 4) )
  circle.draggable(true)
  layer.add(circle)  # add the shape to the layer

  stage.add(layer)   # add the layer to the stage

main()
