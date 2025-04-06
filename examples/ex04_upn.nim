import diagram
import std/strformat
import std/jsconsole
import std/[jsffi]


proc main =
  #var stage = newStage("container", 1000, 800)
  var stage = newStage(js{container: "container".cstring, width : "1000".cstring, height: "800".cstring})
  #stage.setContainer("container")
  #stage.height(800)
  #stage.width(1000)
  let layer = newLayer()

  let step1 = newStep( Step(n:1, title:"Request support", by: @["Customer", "Technical Support"]) )
  let step2 = newStep( Step(n:2, title:"Resolve sales support request", by: @["Sales"], x:300) )
  let arrow = connect(step1, step2)
  step2.on("dragmove", update)
  step1.on("dragmove", update)
  layer.add(step1)
  layer.add(step2)
  layer.add(arrow)



  # var tooltip = newLabel(LabelOptions(x:170,y:75,opacity:0.75))
  # var tag = newTag(TagOptions(fill: "black",
  #                             pointerDirection: "down",
  #                             pointerWidth: 10,
  #                             pointerHeight: 10,
  #                             lineJoin: "round",
  #                             shadowColor: "black",
  #                             shadowBlur: 10,
  #                             shadowOffsetX: 10,
  #                             shadowOffsetY: 10,
  #                             shadowOpacity: 0.5))
  # var tooltipText = newText(Text(text: "Tooltip pointing down",
  #                                fontFamily: "Calibri",
  #                                fontSize: 18,
  #                                padding: 5,
  #                                fill: "white"))
  # tooltip.add(tag)
  # tooltip.add(tooltipText)
  # #layer.add(tooltip)
  stage.add(layer)
  layer.draw()

  console.log step1.getRightAnchor()

main()

