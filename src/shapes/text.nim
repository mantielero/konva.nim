import jsffi
import shape


type
  TextObj* {.importc:"Konva.Text".} = ref object of ShapeObj
    offsetX*:proc(offset:cint) {.closure.}
    offsetY*:proc(offset:cint) {.closure.}    
    # width*:proc():cint {.closure.}
    # height*:proc():cint {.closure.}

  Text* = ref object of JsObject
    x*:cdouble
    y*:cdouble
    text*:cstring
    fontFamily*:cstring
    fontSize*:cint
    padding*:cint
    fill*:cstring
    align*:cstring

proc newText*(options:Text|JsObject):TextObj {.importcpp:"new Konva.Text(@)".}

# proc newText*(x,y:SomeNumber; text:string; 
#               fontSize:uint; fontFamily:string; fill:string;
#               align:string  = "";
#               width:int = 0; padding:int = 0):TextObj =
#   var options = newJsObject()
#   options["x"] = x
#   options["y"] = y
#   options["text"] = text.cstring
#   options["fontSize"] = fontSize.cint
#   options["fontFamily"]  = fontFamily.cstring
#   options["fill"]  = fill.cstring
#   if align != "":
#     options["align"] = align.cstring
#   if width > 0:
#     options["width"] = width.cint
#   if padding > 0:
#     options["padding"] = padding.cint
#   return newText(options)

#[


      var rect = new Konva.Rect({
        x: 20,
        y: 60,
        stroke: '#555',
        strokeWidth: 5,
        fill: '#ddd',
        width: 300,
        height: complexText.height(),
        shadowColor: 'black',
        shadowBlur: 10,
        shadowOffsetX: 10,
        shadowOffsetY: 10,
        shadowOpacity: 0.2,
        cornerRadius: 10,
      });

      // add the shapes to the layer
      layer.add(simpleText);
      layer.add(rect);
      layer.add(complexText);

      // add the layer to the stage
      stage.add(layer);
    </script>
]#