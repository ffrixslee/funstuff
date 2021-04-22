List2D := List clone

dim := method(x,y, List2D clone setSize(y) mapInPlace(_, List clone setSize(x)) )

dim(3,8) println

List2D set := method(x,y,value, at(y) atPut(x,value))
List2D get := method(x,y, at(y) at(x))

l := dim(3,8)
l set(1,7,"foo")
l get(1,7) println

List2D transpose := method(
  other := dim(size, at(0) size)
  foreach(y,row, row foreach(x,value, other set(y,x,value)))
  other
)

List2D with := method( source,
  result := dim(source size, source at(0) size)
  source foreach(y,row, row foreach(x,value, result set(x,y,value)))
  result
)

l := dim(2,2)
l set(0,0,1)
l set(1,0,2)
l set(0,1,3)
l set(1,1,4)
l println
l transpose println

List2D serializeTo := method(path, File open(path) write(serialized) close)
List2D serializeFrom := method(path, with(doFile(path)))

l serializeTo("list.io")
m := List2D serializeFrom("list.io")

l println
m println

