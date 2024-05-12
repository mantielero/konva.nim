import jsffi
export jsffi
#import std/jsconsole
import shapes/[shape, group, circle,  rect, text, label, tag, line, arrow]
export shape, group, circle, rect, text, label, tag, line, arrow

import stage/stage
export stage

import layer/layer
export layer

import context/context
export context

import common/converters
export converters

when not defined(js):
  {.error: "This module only works on the JavaScript platform".}




