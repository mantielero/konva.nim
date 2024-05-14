import konva
import std/strformat
import std/jsconsole
import std/dom

type
  # StepObj = object of GroupObj

  StepObj* = ref object of GroupObj
    ins*:seq[GroupObj] 
    outs*:seq[GroupObj]

    

  Step* = ref object of Group
    n*:int
    title*:string
    by*:seq[string]
    # x*:int = 0
    # y*:int = 0
    #width*:int = 200
    # height*:int = 0
    # draggable*:bool = false




proc getRightAnchor*(step:StepObj):tuple[x,y:int] =
  var w = step.width()
  var h = step.height()#() 
  h = 150
  var x = step.x()
  var y = step.y()
  return ((x + w).int, (y + h/2).int)

proc getLeftAnchor*(step:StepObj):tuple[x,y:int] =
  var w = step.width()
  var h = step.height()#.int
  h = 150
  var x = step.x()
  var y = step.y()
  return ((x).int, (y + h/2).int)

proc newStep*(val:Step):StepObj = 
  var newVal = val
  if not (val.width > 0):
    newVal["width"] = 200
  if not val.draggable:
    newVal["draggable"] = true
  let headerHeight = 50
  let titleHeight  = 100
   
  #let group = newGroup(val)#Group{ width:val.width.cdouble, height:200, draggable:true}) # x:20,y:20,

  let group = newGroup(newVal)#Group{ width:val.width.cdouble, height:200, draggable:true})

  # Step Number
  let stepNumberH = 20
  let stepNumber = newText( Text{ width: group.width(), text: &"{val.n}", 
                                  fontSize:25, fontFamily:"Calibri", fill:"darkgray",
                                  align:"left", padding:10 } )

  group.add(stepNumber)

  # Step Title
  let stepTitle = newText( Text{ width: group.width(), text: val.title, 
                                 fontSize:stepNumberH, fontFamily:"Arial", fill:"black",
                                 align:"center", padding:10 } )

  stepTitle.offsetY(-headerHeight)



  group.add(stepTitle)

  # Actionees
  let actioneeH = 50
  var n = 0
  var h = headerHeight + titleHeight 
  for actionee in val.by:
    let line = newLine( Line{points: @[0,h,group.width().int,h],stroke:"black", strokeWidth:1} )

    let actioneeTxt = newText( Text{ width: group.width(), text: actionee, 
                                     fontSize:20, fontFamily:"Arial", fill:"blue",
                                     align:"left", padding:10 } )
    actioneeTxt.offsetY(-h)
    h =  h + actioneeTxt.height().int



    group.add(line)
    group.add(actioneeTxt)
    n += 1

  # Rectangle
  if val.height != 0:  # Force step height
    h = val.height.int
  let rect = newRect(Rect{ width:group.width(), height: h.cdouble, 
                      fill:"lightgray", stroke:"black", strokeWidth:4,
                      shadowBlur: 10, cornerRadius:10} )
  group.setHeight(h)
  group.add(rect) 
  rect.zIndex(0)

  var tmp = group.StepObj
  tmp.ins = @[]
  tmp.outs = @[]

  return tmp #group.StepObj

type
  ConnectionObj* = GroupObj

proc connect(step1,step2:StepObj):ConnectionObj =

  var start = step1.getRightAnchor() #(x:200, y:100)
  var ending = step2.getLeftAnchor() #(x:300, y:100)
  console.log start
  console.log ending


  let group = newGroup(Group{x: start.x, y:start.y, width: (ending.x - start.x)})


  let circle1 = newCircle(Circle{x:0,y:0,radius:6, 
                  stroke: "black", fill: "white", strokeWidth:4})
  let circle2 = newCircle(Circle{x:group.width(),y: 0, radius:6, 
                  stroke: "black", fill: "white", strokeWidth:4})                  
  let arrow = newArrow(Arrow{ points: @[(0+6).cint,0,(group.width().int - 6 - 4).cint,0], stroke: "black", strokeWidth: 4})

  group.add(circle1)
  group.add(circle2)
  group.add(arrow)

  step1.outs &= group  
  step2.ins &= group
  return group

#proc updateArrow(shape,arrow:GroupObj) =





proc update(evt:Event) =
  #console.log("target: ", typeof(evt.target) ) #children[0])
  var shape = evt.target.toJS().ShapeObj
  var shapeX = shape.x().int
  var shapeY = shape.y().int
  var shapeWidth = shape.width().int
  var shapeHeight = shape.height().int

  for arrowGroup in shape.ins:
    var myPoints = arrowGroup.children[2].points()
    var arrowX = arrowGroup.x()
    var arrowY = arrowGroup.y()
    #var arrowWidth = arrowGroup.width()
    #var tmpX = 100 # arrowGroup.children[1].x().to(int)
    #console.log tmpX + shapeX
    arrowGroup.children[1].y(shapeY)
    arrowGroup.children[1].x(shapeX.cint - shapeWidth.cint)    
    arrowGroup.children[2].setPoints( @[myPoints[0].to(cint),
                                     myPoints[1].to(cint),
                                     (shapeX - shapeWidth - 6 - 4).cint,
                                     shapeY.cint]  )
  for arrowGroup in shape.outs:
    #console.log ">>>"
    var myPoints = arrowGroup.children[2].points()
    #console.log myPoints
    #var arrowX = arrowGroup.x()
    #var arrowY = arrowGroup.y()
    #var arrowWidth = arrowGroup.width()
    #var tmpX = 100 # arrowGroup.children[1].x().to(int)
    #console.log tmpX + shapeX
    arrowGroup.children[0].y(shapeY)
    arrowGroup.children[0].x(shapeX.cint)    

    arrowGroup.children[2].points( @[(shapeX+6).cint,
                                     shapeY.cint,
                                     myPoints[2].to(cint),
                                     myPoints[3].to(cint)]  )    
  # Somehow we know the arrows that require update due to the shape being moved.

  #console.log("target: ", node.x())
  #echo node.x()
  #echo typeof(evt.target)
  #console.log("currentTarget: ", evt.currentTarget.x ) #children[0].parent.attrs.x())
  #console.log("currentTarget: ", evt.currentTarget.children[0].x)
  #var shape = evt.target;
  #var group = evt.currentTarget;

proc main =
  var stage = newStage("container", 1000, 800)
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

