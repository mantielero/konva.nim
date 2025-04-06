#import jsffi

converter toCstring*(val:string): cstring =
  val.cstring

converter toCint*(val:int): cint =
  val.cint

converter toCdouble*(val:float): cdouble =
  val.cdouble

converter toCdouble*[T:SomeInteger](val:T): cdouble =
  val.cdouble