const res = await fetch("./error.wasm");
const wasmBytes = await res.arrayBuffer();

const { instance: wasmInstance } = await WebAssembly.instantiate(wasmBytes);
wasmInstance.exports.error();
