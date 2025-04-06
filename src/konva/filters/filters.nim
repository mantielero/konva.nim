# https://forum.nim-lang.org/t/12762

#import jsffi
#import ../common/konva
#import ../shapes/types

#var node {.importc,nodecl.}: JsObject
#var Konva {.importc,nodecl.}: JsObject

#proc filters(obj: JsObject, filters: openArray[JsObject]) {.importcpp.} 
#type

#  Filter* {.importc,nodecl.} = proc(self:NodeObj; imageData: ImageData)
  
  #Blur* {.importc.}         = ref object of Filters
  #Blur* {.importc:"Konva.Filters.Blur".} = Filters

# https://github.com/konvajs/konva/blob/fe80a444073f11e37e042b059cbfb5bd528e69d8/src/filters/Blur.ts#L368

#proc blur*(self:NodeObj; imageData: ImageData)  {.importcpp: "Konva.Filters.Blur(@)".}



#[
/**
 * Blur Filter
 * @function
 * @name Blur
 * @memberof Konva.Filters
 * @param {Object} imageData
 * @example
 * node.cache();
 * node.filters([Konva.Filters.Blur]);
 * node.blurRadius(10);
 */
export const Blur: Filter = function Blur(imageData) {
  const radius = Math.round(this.blurRadius());

  if (radius > 0) {
    filterGaussBlurRGBA(imageData, radius);
  }
};

]#


#let blur*:Filters {.importcpp:"Konva.Filters.Blur(@)".}

#export type Filter = (this: Node, imageData: ImageData) => void;

#var blur:Filters
#proc Blur* {.importcpp: "Konva.Filters.Blur", nodecl.}: Filters
#proc blur*() {.importcpp: "Konva.Filters.Blur".}

#let Blur* = Filters.Blur
#  Blur*    {.importc:"Konva.Filters.Blur".} = ref object of Filters


#[
type
  StageObj* {.importc:"Konva.Stage".} = ref object of JsObject
]#