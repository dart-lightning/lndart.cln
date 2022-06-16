CC=dart pub global run melos
CC_TEST=spec
CC_CHANGELOG=dart pub global run changelog_cmd

default: analyze
	$(CC) run build_plugin --no-select

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

ci_check_plugin:
	$(CC) run plugin_test --no-select

ci_fmt_rpc:
	$(CC) run rpc_analyze --no-select

ci_fmt_plugin:
	$(CC) run plugin_analyze --no-select

ci_coverage_rpc:
	$(CC) run rpc_test_coverage --no-select

ci_coverage_plugin:
	$(CC) run plugin_test_coverage --no-select

check_rpc: ci_fmt_rpc ci_check_rpc

check_plugin: ci_fmt_plugin ci_check_plugin

changelog_rpc:
	cd packages/rpc && $(CC_CHANGELOG)

changelog_plugin:
	cd packages/rpc && $(CC_CHANGELOG)

changelog: changelog_rpc changelog_plugin

ci: dep ci_check_rpc check_plugin

clean:
	$(CC) clean