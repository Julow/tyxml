open Html5

let to_string x =
  let b = Buffer.create 17 in
  P.print_list ~output:(Buffer.add_string b) x ;
  Buffer.contents b

let tyxml_tests l =
  let f (name, (ty : Html5_types.body_content M.elt), s) =
    name, `Quick, fun () -> Alcotest.(check string) name (to_string @@ [ty]) s
  in
  List.map f l

let elements_html = "elements", tyxml_tests M.[

  "div",
  div [a []],
  "<div><a></a></div>" ;

  "a",
  canvas [a []],
  "<canvas><a></a></canvas>";


]


let () =
  Alcotest.run "html" [
    elements_html ;
  ]