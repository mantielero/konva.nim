import konva
import std/dom, jsconsole
# Custom shape
type
  TriangleObj* = ref object of ShapeObj  

proc createTriangle(context: ContextObj; shape:ShapeObj) =
    context.beginPath()
    context.moveTo(20, 50)
    context.lineTo(220, 80)
    context.quadraticCurveTo(150, 100, 260, 170)
    context.closePath()
    context.fillStrokeShape(shape) # special Konva.js method

proc newTriangle*():ShapeObj =
  result = newShape( Shape{fill:"#00D2FF", stroke: "black", strokeWidth: 4, sceneFunc: createTriangle} )

#[
var triangle = new Konva.Shape({
      sceneFunc: function(context) {
        context.beginPath();
        context.moveTo(20, 50);
        context.lineTo(220, 80);
        context.quadraticCurveTo(150, 100, 260, 170);
        context.closePath();

        // special Konva.js method
        context.fillStrokeShape(this);
      },
      fill: '#00D2FF',
      stroke: 'black',
      strokeWidth: 4
});
]#



proc main =
  var stage = newStage("container", 1000, 800)
  let layer = newLayer()
  let circle = newCircle( Circle{x: (stage.width()/2).float, y: (stage.height()/2), radius: 70,
                                 fill: "red", stroke: "black", strokeWidth: 4} )
  let triangle = newTriangle()
  let rect1 = newRect( Rect{x: 20, y: 20, width: 100, height: 50, fill: "green", stroke: "black", 
                            strokeWidth: 4})
  let rect2 = newRect( Rect{x: 150, y: 40, width: 100, height: 50, 
                            fill: "red", stroke: "black", shadowBlur: 10, cornerRadius: 10})
  #let rect3 = newRect( Rect{x: 50, y: 120, width: 100, height: 100, 
  #                          fill: "blue", cornerRadius: @[0,10,20,30])  
  layer.add(rect1)
  layer.add(rect2) 
  #layer.add(rect3)

  let simpleText = newText( Text{ x: stage.width()/2, y: 15, text: "Simple Text", 
                                  fontSize: 30, fontFamily: "Calibri", stroke: "green"} )
  # to align text in the middle of the screen, we can set the
  # shape offset to the center of the text shape after instantiating it
  simpleText.offsetX((simpleText.width() / 2).cint)  
  layer.add(simpleText)  


  # since this text is inside of a defined area, we can center it using
  # align: 'center'
  var complexText = newText( Text{ x: 20, y: 60, text: """COMPLEX TEXT
ll the world's a stage, and all the men and women merely players. They have their exits and their entrances.""",
fontSize: 18, fontFamily: "Calibri",
stroke: "#555",
width: 300, padding: 20, align: "center"} )

  var rect = newRect( Rect{x: 20, y: 60,width: 300, height: complexText.height(), 
                           fill:"#ddd", stroke:"#555", strokeWidth: 5,
              shadowColor: "black",shadowBlur: 10, shadowOffsetX: 10, shadowOffsetY: 10, shadowOpacity: 0.2,
              cornerRadius:10 } )

  layer.add(rect)
  layer.add(complexText)


  var tooltip = newLabel(LabelOptions(x:300,y:200,opacity:0.75))
  var tag = newTag(Tag(fill: "black",
                              pointerDirection: "down",
                              pointerWidth: 10,
                              pointerHeight: 10,
                              lineJoin: "round",
                              shadowColor: "black",
                              shadowBlur: 10,
                              shadowOffsetX: 10,
                              shadowOffsetY: 10,
                              shadowOpacity: 0.5))
  var tooltipText = newText(Text{text: "Tooltip pointing down",
                                        fontFamily: "Calibri",
                                        fontSize: 18,
                                        padding: 5,
                                        fill: "white"})


  # events
  circle.on("mouseover", proc(evt:Event) =
        console.log("Mouseover circle")
  )
      
  tooltip.add(tag)
  tooltip.add(tooltipText)
  layer.add(tooltip)
  layer.add(triangle)
  layer.add(circle)  
  stage.add(layer)
  layer.draw()

main()

