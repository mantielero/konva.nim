import konva
import jsffi

# https://konvajs.org/docs/overview.html#how-does-it-work

proc main =
  #var stage:StageObj = newStage("container", 500, 500)
  var stage = newStage(js{container: "container".cstring, width: "500".cstring, height: "500".cstring})
  
  var layer = newLayer()
  var circle = newCircle(Circle(x: (stage.width()/2).float, 
                                y: (stage.height()/2), 
                                radius: 70,
                                fill: "red", 
                                stroke: "black", 
                                strokeWidth: 4) )
  #circle.draggable("true")
  circle.cache()
  #circle.filters([Konva.Filters.Blur])
  #circle.filters(@[blur])
  circle.filters(@[blurFilter])
  #circle.filters(@[blur])

  circle.blurRadius(10)

  layer.add(circle)  # add the shape to the layer

  stage.add(layer)   # add the layer to the stage

main()
