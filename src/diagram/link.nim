import tkonva
import box
import std/jsconsole

type
  ConnectionObj* = GroupObj

proc connect*(step1,step2:StepObj):ConnectionObj =

  var start = step1.getRightAnchor() #(x:200, y:100)
  var ending = step2.getLeftAnchor() #(x:300, y:100)
  console.log start
  console.log ending


  let group = newGroup(Group(x: start.x, y:start.y, width: (ending.x - start.x)))


  let circle1 = newCircle(Circle(x:0,y:0,radius:6, 
                  stroke: "black", fill: "white", strokeWidth:4))
  let circle2 = newCircle(Circle(x:group.width(),y: 0, radius:6, 
                  stroke: "black", fill: "white", strokeWidth:4))                  
  let arrow = newArrow(Arrow( points: @[(0+6).cint,0,(group.width().int - 6 - 4).cint,0], stroke: "black", strokeWidth: 4))

  group.add(circle1)
  group.add(circle2)
  group.add(arrow)

  step1.outs &= group  
  step2.ins &= group
  return group
  