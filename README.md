# Tests for WebAssembly stack traces

The [WebAssembly Web API](https://webassembly.github.io/spec/web-api/)
specification suggests a format for stack traces of errors that originate in or
propagate through WASM modules. In particular, it suggests that "when the
response-based instantiation API is used" (i.e. `WebAssembly.compileStreaming()`
and `WebAssembly.instantiateStreaming()`), the response's URL should be used.

This repo provides a WASM module that exports a single function `error` that
takes no arguments and traps, throwing an exception on the JS side when called.
It also provides two JS modules (and corresponding HTML pages that call them) to
test the stack traces in browsers and in other JS runtimes like Deno.

To test this in Deno, start a server, and then run either `syncTest.js` or
`asyncTest.js` with `--allow-net`, and with the `--location` flag set to the
corresponding HTML file:

```sh
# This will start a server serving the current folder on port 4507.
deno run --allow-net --allow-read https://deno.land/std/http/file_server.ts >/dev/null &

deno run --allow-net --location http://localhost:4507/syncTest.html http://localhost:4507/syncTest.js

deno run --allow-net --location http://localhost:4507/asyncTest.html http://localhost:4507/asyncTest.js

# Kill the server
kill $!
```

To build `error.wasm`, you need [`cargo`](https://github.com/rust-lang/cargo/)
and `wasm-strip` from the [`wabt`](https://github.com/webassembly/wabt) toolkit.