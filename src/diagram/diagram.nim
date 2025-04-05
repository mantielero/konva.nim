import jsffi
import std/dom
import tkonva


type
  Diagram* = ref object of JsObject
    name:string
  



proc update*(evt:Event) =
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

# ---------------------------------------------------------  

proc newDiagram*():Diagram =
  return new Diagram

proc setName*(self: Diagram; name: string) =
  self.name = name




