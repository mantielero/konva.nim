import konva

proc main =
  var stage = newStage("container", 500, 500)
  let layer = newLayer()
  let circle = newCircle( (stage.width()/2), (stage.height()/2), 70,
                          "red", "black", 4)
  let triangle = newTriangle()
  let rect1 = newRect(20,20, 100,50, "green", "black", 4)
  let rect2 = newRect(150,40, 100,50, "red", "black", shadowBlur=10, cornerRadius=10)
  let rect3 = newRect(50,120, 100,100, "blue", cornerRadiusSeq = @[0,10,20,30])  
  layer.add(rect1)
  layer.add(rect2) 
  layer.add(rect3)

  let simpleText = newText(stage.width()/2, 15, "Simple Text", 30, "Calibri", "green")
  # to align text in the middle of the screen, we can set the
  # shape offset to the center of the text shape after instantiating it
  simpleText.offsetX((simpleText.width() / 2).cint)  
  layer.add(simpleText)  


  # since this text is inside of a defined area, we can center it using
  # align: 'center'
  var complexText = newText(20,60, """COMPLEX TEXT
ll the world's a stage, and all the men and women merely players. They have their exits and their entrances.""",
18, "Calibri",
"#555",
width= 300, padding = 20, align= "center")

  var rect = newRect(20,60,300, complexText.height(), "#ddd", "#555", 5,
              shadowColor="black",shadowBlur=10, shadowOffsetX=10, shadowOffsetY=10, shadowOpacity=0.2,
              cornerRadius=10 )

  layer.add(rect)
  layer.add(complexText)


  var tooltip = newLabel(LabelOptions(x:170,y:75,opacity:0.75))
  var tag = newTag(TagOptions(fill: "black",
                              pointerDirection: "down",
                              pointerWidth: 10,
                              pointerHeight: 10,
                              lineJoin: "round",
                              shadowColor: "black",
                              shadowBlur: 10,
                              shadowOffsetX: 10,
                              shadowOffsetY: 10,
                              shadowOpacity: 0.5))
  var tooltipText = newText(TextOptions(text: "Tooltip pointing down",
                                        fontFamily: "Calibri",
                                        fontSize: 18,
                                        padding: 5,
                                        fill: "white"))
  tooltip.add(tag)
  tooltip.add(tooltipText)
  layer.add(tooltip)
  stage.add(layer)
  layer.draw()

main()

