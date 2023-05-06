CC=dart pub global run melos
CC_TEST=spec
CC_CHANGELOG=dart pub global run changelog_cmd

default: analyze
	$(CC) run build_plugin --no-select

dep:
	dart pub global activate melos 2.9.0;
#	dart pub global activate spec_cli;
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

ci_check_common:
	$(CC) run common_test --no-select

ci_check_lnlambda:
	$(CC) run lnlambda_test --no-select

ci_fmt_rpc:
	$(CC) run rpc_analyze --no-select

ci_fmt_plugin:
	$(CC) run plugin_analyze --no-select

ci_fmt_common:
	$(CC) run common_analyze --no-select

ci_fmt_lnlambda:
	$(CC) run lnlambda_analyze --no-select

ci_coverage_rpc:
	$(CC) run rpc_test_coverage --no-select

ci_coverage_plugin:
	$(CC) run plugin_test_coverage --no-select

check_rpc: ci_fmt_rpc ci_check_rpc

check_plugin: ci_fmt_plugin ci_check_plugin

check_common: ci_fmt_common ci_check_common

check_lnlambda: ci_fmt_lnlambda ci_check_lnlambda

changelog_rpc:
	cd packages/rpc && $(CC_CHANGELOG)

changelog_plugin:
	cd packages/rpc && $(CC_CHANGELOG)

changelog_lnlambda:
	cd packages/rpc && $(CC_CHANGELOG)

changelog_cln_common:
	cd packages/cln_common && $(CC_CHANGELOG)

changelog: changelog_rpc changelog_plugin changelog_cln_common changelog_lnlambda

ci: dep ci_check_rpc check_plugin check_common check_lnlambda

clean:
	$(CC) clean
