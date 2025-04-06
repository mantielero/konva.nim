import tkonva
import box
import std/strformat

type
  Step* = ref object of Group
    n*:int
    title*:cstring
    by*:seq[cstring]
    # x*:int = 0
    # y*:int = 0
    #width*:int = 200
    # height*:int = 0
    #draggable*:bool = false


proc newStep*(val:Step):StepObj = 
  var newVal = val
  if not (val.width > 0):
    newVal.width = 200
  if not val.draggable:
    newVal.draggable = true
  let headerHeight = 50
  let titleHeight  = 100
   
  #let group = newGroup(val)#Group{ width:val.width.cdouble, height:200, draggable:true}) # x:20,y:20,

  let group = newGroup(newVal)#Group{ width:val.width.cdouble, height:200, draggable:true})

  # Step Number
  let stepNumberH = 20
  let stepNumber = newText()
  stepNumber.width(group.width()) 
  stepNumber.text( &"{val.n}" )
  stepNumber.fontSize( 25 )
  stepNumber.fontFamily("Calibri")
  stepNumber.fill("darkgray")
  stepNumber.align("left")
  stepNumber.padding(10)


  group.add(stepNumber)

  # Step Title
  let stepTitle = newText( )
  stepTitle.width(group.width()) 
  stepTitle.text( val.title )
  stepTitle.fontSize( stepNumberH )
  stepTitle.fontFamily("Arial")
  stepTitle.fill("black")
  stepTitle.align("center")
  stepTitle.padding(10)
  stepTitle.offsetY(-headerHeight)



  group.add(stepTitle)

  # Actionees
  let actioneeH = 50
  var n = 0
  var h = headerHeight + titleHeight 
  for actionee in val.by:
    let line = newLine( Line(points: @[0,h,group.width().int,h],stroke:"black", strokeWidth:1) )

    let actioneeTxt = newText( )
    actioneeTxt.width(group.width()) 
    actioneeTxt.text( actionee )
    actioneeTxt.fontSize( 20 )
    actioneeTxt.fontFamily("Arial")
    actioneeTxt.fill("blue")
    actioneeTxt.align("left")
    actioneeTxt.padding(10)                                     
    actioneeTxt.offsetY(-h)
    h =  h + actioneeTxt.height().int



    group.add(line)
    group.add(actioneeTxt)
    n += 1

  # Rectangle
  if val.height != 0:  # Force step height
    h = val.height.int
  let rect = newRect(Rect( width:group.width(), height: h.cdouble, 
                      fill:"lightgray", stroke:"black", strokeWidth:4,
                      shadowBlur: 10, cornerRadius:10) )
  group.height(h.cdouble)
  group.add(rect) 
  rect.zIndex(0)

  var tmp = group.StepObj
  tmp.ins = @[]
  tmp.outs = @[]

  return tmp #group.StepObj