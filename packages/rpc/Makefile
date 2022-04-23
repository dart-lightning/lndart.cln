CC=dart
FMT=format
ARGS="--help"
PROBLEM=

default: fmt

dep:
	$(CC) pub get

fmt:
	$(CC) $(FMT) .
	$(CC) analyze .

gen:
	$(CC) run build_runner build

clean:
	rm lib/src/**/*.g.dart
	rm lib/src/**/*.gql.dart

check:
	$(CC) test