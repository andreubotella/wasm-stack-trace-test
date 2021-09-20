error.wasm: error-wasm/Cargo.toml error-wasm/src/lib.rs
	cd error-wasm && \
		cargo build --target wasm32-unknown-unknown --release && \
		wasm-strip ./target/wasm32-unknown-unknown/release/error.wasm && \
		cp ./target/wasm32-unknown-unknown/release/error.wasm ../

clean:
	cd error-wasm && cargo clean
	rm ./error.wasm