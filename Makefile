LOGDIR   := ./logs
CACHEDIR := ./cache

.PHONY: serve
serve:
	RUST_LOG=wagi=trace ./wagi -c modules.toml -l '0.0.0.0:8080' --log-dir ${LOGDIR} --module-cache ${CACHEDIR} -e "HOME=/" -e "GEM_HOME=/.gem"

.PHONY: serve-spin
serve-spin:
	RUST_LOG=spin=info,wagi=info spin up --file spin.toml

.PHONY: run-wasmtime
run-wasmtime:
	wasmtime ruby.wasm --mapdir /::./ -- lib/env.rb

.PHONY: tail-logs
tail-logs:
	tail -f ${LOGDIR}/*/*
