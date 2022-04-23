CC=dart pub global run melos
CC_TEST=spec
CC_CHANGELOG=dart pub global run changelog_cmd

default: analyze check

dep:
	dart pub global activate melos;
	dart pub global activate spec_cli;
	dart pub global activate changelog_cmd;
	$(CC) bootstrap

check:
	$(CC_TEST)

fmt:
	$(CC) run format --no-select

analyze: fmt
	$(CC) run analyze --no-select

ci_check_rpc:
	$(CC) run rpc_test --no-select

ci_fmt_rpc:
	$(CC) run rpc_analyze --no-select

ci_coverage_rpc:
	$(CC) run client_test_coverage --no-select

check_rpc: ci_fmt_rpc ci_check_rpc

changelog_rpc:
	cd packages/rpc && $(CC_CHANGELOG)

changelog: changelog_rpc

ci: dep ci_check_rpc

clean:
	$(CC) clean