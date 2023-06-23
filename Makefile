install:
	raco pkg install sicp
	raco pkg install review

test:
	raco test sicp
.PHONY: test
