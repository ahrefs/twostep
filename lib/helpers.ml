module Int = Base.Int
module String = Base.String
module Char = Base.Char

let __nullchar = Char.of_int_exn 0

type padding =
  | OnLeft
  | OnRight

let padOnLeft = OnLeft

let padOnRight = OnRight

let pad ~basis ~direction ?(byte = __nullchar) msg =
  let length = String.length msg in
  let remainder = length mod basis in
  if remainder = 0
  then msg
  else
    let zerofill = String.make (basis - remainder) byte in
    match direction with OnRight -> msg ^ zerofill | OnLeft -> zerofill ^ msg
