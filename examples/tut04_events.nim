import konva
import std/dom, jsconsole

# https://konvajs.org/docs/overview.html#events


proc main =
  var stage = newStage("container", 500, 500)
  var layer = newLayer()
  var circle = newCircle(Circle(x: (stage.width()/2).float, 
                                y: (stage.height()/2), 
                                radius: 70,
                                fill: "red", 
                                stroke: "black", 
                                strokeWidth: 4) )
  # when the mouse goes out of the circle
  circle.on("mouseout touchend",  
    proc(ev:Event) = 
      console.log("user input")
  )
  circle.on("xChange", 
    proc(ev:Event) = 
      console.log("position change")
  )
  circle.on("dragend", 
    proc(ev:Event) = 
      console.log("drag stopped")
  )

  layer.add(circle)  # add the shape to the layer
  
  stage.add(layer)   # add the layer to the stage
  layer.draw()

main()
