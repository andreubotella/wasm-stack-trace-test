#[no_mangle]
pub extern "C" fn error() {
    core::arch::wasm32::unreachable();
}
