import jsffi
import ../shapes/shape
# https://konvajs.org/api/Konva.Shape.html#sceneFunc__anchor
#[
get/set scene draw function. That function is used to draw the shape on a canvas.
Also that function will be used to draw hit area of the shape, in case if hitFunc is not defined.
#[
// get scene draw function
var sceneFunc = shape.sceneFunc();

// set scene draw function
shape.sceneFunc(function(context, shape) {
  context.beginPath();
  context.rect(0, 0, shape.width(), shape.height());
  context.closePath();
  // important Konva method that fill and stroke shape from its properties
  // like stroke and fill
  context.fillStrokeShape(shape);
});
]#

]#


