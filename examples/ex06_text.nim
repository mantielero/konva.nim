import konva
import std/dom, jsconsole

proc main =
  var stage = newStage("container", 1000, 800)
  let layer = newLayer()

  # Text
  let txt1 = newText()
  txt1.text("""COMPLEX TEXT
ll the world's a stage, and all the men and women merely players. They have their exits and their entrances.""")
  txt1.offsetX(-20)
  txt1.offsetY(-20)

  txt1.name("red")
  txt1.addName("selected")
  console.log(txt1.name())

  txt1.align("center")
  console.log(txt1.align())

  txt1.alpha(0.7)
  txt1.blue(255)

  txt1.widthAuto()
  console.log(txt1.width())

  txt1.x(100.5)
  txt1.y(50.3)
  #console.log(txt1)
  #console.log(txt1.attrs.text)
  console.log(txt1.text())
  console.log(txt1.offsetX())

  layer.add(txt1)
  stage.add(layer)
  layer.draw() 


main()