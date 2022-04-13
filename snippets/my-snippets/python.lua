local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("dbg", {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    t({ "# fmt: off",
      "import threading, debugpy; thread_id = threading.get_native_id(); port = thread_id%(65535-1023)+1024; host, port = debugpy.listen(port); print(f'Debugpy: Listening on {host}:{port}. Thread id: {thread_id}'); debugpy.wait_for_client(); print(f'Client attached'); debugpy.breakpoint()",
      "# fmt: on" }
    )
  }),
}
