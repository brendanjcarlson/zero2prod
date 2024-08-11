.PHONY: watch
watch:
	@cargo watch -x check -x test -x run

.PHONY: ci
ci:
	@cargo check
	@cargo test
	@cargo tarpaulin --ignore-tests
	@cargo clippy -- -D warnings
	@cargo fmt -- --check
	@cargo audit

.PHONY: build
build: ci
	@cargo build
