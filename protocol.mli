type io = Json.json Stream.t * (Json.json -> unit)

val make : input:in_channel -> output:out_channel -> io
val log  : dest:out_channel -> io -> io

val return : Json.json list -> Json.json
val fail   : exn -> Json.json

(* HACK. Break circular reference:
 * Error_report uses Protocol to format error positions.
 * Protocol uses Error_report to format standard errors.
 *)
val error_catcher : (exn -> Json.json option) ref

val pos_to_json : Lexing.position -> Json.json
val pos_of_json : Json.json -> int * int
