#import jsffi
#export jsffi
#import std/jsconsole


import konva/shapes/[types, shape, group, circle,  rect, text, label, tag, line, arrow, node, regularpolygon]
export types, shape, group, circle, rect, text, label, tag, line, arrow, node,regularpolygon

import konva/stage/stage
export stage

import konva/layer/layer
export layer

# import context/context
# export context

import konva/common/[konva, converters]
export konva, converters

import konva/filters/filters
export filters


#import diagram/[diagram,box,link,step]
#export diagram,box,link,step

when not defined(js):
  {.error: "This module only works on the JavaScript platform".}




