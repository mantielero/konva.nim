import konva
import std/dom, jsconsole

# https://konvajs.org/docs/overview.html#styles


proc main =
  var stage = newStage("container", 500, 500)
  var layer = newLayer()
  var pentagon = newRegularPolygon(
                                RegularPolygon(
                                    x: stage.width() / 2,
                                    y: stage.height() / 2,
                                    sides: 5,
                                    radius: 70,
                                    fill: "red",
                                    stroke: "black",
                                    strokeWidth: 4,
                                    shadowOffsetX: 20,
                                    shadowOffsetY: 25,
                                    shadowBlur: 40,
                                    opacity: 0.5
                            ) )
  layer.add(pentagon)  # add the shape to the layer
  
  stage.add(layer)   # add the layer to the stage
  layer.draw()

main()
