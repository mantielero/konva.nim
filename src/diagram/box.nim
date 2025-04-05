import tkonva

type
  StepObj* = ref object of GroupObj
    ins*:seq[GroupObj] 
    outs*:seq[GroupObj]

proc getRightAnchor*(step:StepObj):tuple[x,y:int] =
  var w = step.width()
  var h = step.height()
  h = 150
  var x = step.x()
  var y = step.y()
  return ((x + w).int, (y + h/2).int)

proc getLeftAnchor*(step:StepObj):tuple[x,y:int] =
  var w = step.width()
  var h = step.height()#.int
  h = 150
  var x = step.x()
  var y = step.y()
  return ((x).int, (y + h/2).int)