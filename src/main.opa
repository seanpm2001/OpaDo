package opado.main

import opado.user
import opado.todo

urls : Parser.general_parser(http_request -> resource) =
  parser
  | {Rule.debug_parse_string(s -> Log.notice("URL",s))} Rule.fail -> error("")
  | "/todos" result={Todo.resource} -> result
  | "/user" result={User.resource} -> result
  | "/login" result={User.resource} -> result
  | (.*) result={Todo.resource} -> result

server = Server.of_bundle([@static_resource_directory("resources")])
server = Server.make(urls)