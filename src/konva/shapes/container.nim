# https://konvajs.org/api/Konva.Container.html
import jsffi
import types
# import tag, text

type
  ContainerObj* {.importc:"Konva.Container".} = ref object of NodeObj