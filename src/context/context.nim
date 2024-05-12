import jsffi
import ../shapes/shape

type
  TriangleObj* = ref object of ShapeObj  
  ContextObj* {.importc:"Konva.Context".} = ref object of JsObject
    beginPath*: proc() {.closure.}
    moveTo*: proc(x,y:cint) {.closure.}
    lineTo*: proc(x,y:cint) {.closure.}
    quadraticCurveTo*: proc(a,b,c,d:cint) {.closure.}
    closePath*: proc() {.closure.}
    # special Konva.js method
    fillStrokeShape*: proc(this:JsObject) {.closure.} 


proc createTriangle(context: JsObject; shape:ShapeObj) =
    context.beginPath()
    context.moveTo(20, 50)
    context.lineTo(220, 80)
    context.quadraticCurveTo(150, 100, 260, 170)
    context.closePath()

    # special Konva.js method
    context.fillStrokeShape(shape)

proc newTriangle*():ShapeObj =
  return newShape(createTriangle, "#00D2FF", "black", 4)
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
