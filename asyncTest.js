const { instance: wasmInstance } = await WebAssembly.instantiateStreaming(
  fetch("./error.wasm")
);
wasmInstance.exports.error();
