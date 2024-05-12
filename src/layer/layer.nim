import jsffi
import ../shapes/shape

type
  LayerObj* {.importc:"Konva.Layer".} = ref object of JsObject
    add*: proc(shape:ShapeObj) {.closure.}
    draw*: proc() {.closure.}
    



proc newLayer*(): LayerObj {. importcpp: "new Konva.Layer()" .}

#proc draw*(layer:LayerObj) {.importcpp: "#.draw(@)" .}
#proc add*(stage:StageObj; layer:LayerObj) {.importcpp: "#.add(@)" .}
#proc add*[T:CircleObj](layer:LayerObj; shape:T) {.importcpp: "#.add(@)" .}