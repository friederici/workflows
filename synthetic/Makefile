
WORKFLOWS := $(wildcard */.)

.PHONY: clean-all $(WORKFLOWS)

all:
	cd 1_const
	make dev-run-none
	make dev-run-constant
	make dev-run-linear
	make dev-run-combi
	cd ..
	cd 2_linear
	make dev-run-none
	make dev-run-constant
	make dev-run-linear
	make dev-run-combi
	cd ..
	cd 3_square
	make dev-run-none
	make dev-run-constant
	make dev-run-linear
	make dev-run-combi
	cd ..
	cd 4_random
	make dev-run-none
	make dev-run-constant
	make dev-run-linear
	make dev-run-combi
	cd ..

none:
	cd 1_const
	make dev-run-none
	cd ..
	cd 2_linear
	make dev-run-none
	cd ..
	cd 3_square
	make dev-run-none
	cd ..
	cd 4_random
	make dev-run-none
	cd ..

constant:
	cd 1_const
	make dev-run-constant
	cd ..
	cd 2_linear
	make dev-run-constant
	cd ..
	cd 3_square
	make dev-run-constant
	cd ..
	cd 4_random
	make dev-run-constant
	cd ..

linear:
	cd 1_const
	make dev-run-linear
	cd ..
	cd 2_linear
	make dev-run-linear
	cd ..
	cd 3_square
	make dev-run-linear
	cd ..
	cd 4_random
	make dev-run-linear
	cd ..

combi:
	cd 1_const
	make dev-run-combi
	cd ..
	cd 2_linear
	make dev-run-combi
	cd ..
	cd 3_square
	make dev-run-combi
	cd ..
	cd 4_random
	make dev-run-combi
	cd ..



clean-all: $(WORKFLOWS)

$(WORKFLOWS):
	$(MAKE) clean -C $@

