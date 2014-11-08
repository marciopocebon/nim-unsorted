proc `^`*(base: int, exp: int): int =
  var (base, exp) = (base, exp)
  result = 1

  while exp != 0:
    if (exp and 1) != 0:
      result *= base
    exp = exp shr 1
    base *= base

proc next(s): int =
  for n in s(): return n

proc powers(m): auto =
  iterator it(): int{.closure.} =
    for n in 0 .. <int.high:
      yield n ^ m
  return it

iterator filtered(s1, s2): int =
  var v = next(s1)
  var f = next(s2)
  while true:
    if v > f:
      f = next(s2)
      continue
    elif v < f:
      yield v
    v = next(s1)

var
  squares = powers(2)
  cubes = powers(3)
  i = 1
for x in filtered(squares, cubes):
  if i > 20:
    echo x
  if i >= 30:
    break
  inc i
