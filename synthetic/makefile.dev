
WORKFLOWS := $(wildcard */.)

.PHONY: clean-all $(WORKFLOWS)

all:
	cd 1_const; $(MAKE) dev-run-none; $(MAKE) dev-run-constant; $(MAKE) dev-run-linear; $(MAKE) dev-run-combi; $(MAKE) dev-run-wary
	cd 2_linear; $(MAKE) dev-run-none; $(MAKE) dev-run-constant; $(MAKE) dev-run-linear; $(MAKE) dev-run-combi; $(MAKE) dev-run-wary
	cd 3_square; $(MAKE) dev-run-none; $(MAKE) dev-run-constant; $(MAKE) dev-run-linear; $(MAKE) dev-run-combi; $(MAKE) dev-run-wary
	cd 4_random; $(MAKE) dev-run-none; $(MAKE) dev-run-constant; $(MAKE) dev-run-linear; $(MAKE) dev-run-combi; $(MAKE) dev-run-wary
	cd 5_compound; $(MAKE) dev-run-none; $(MAKE) dev-run-constant; $(MAKE) dev-run-linear; $(MAKE) dev-run-combi; $(MAKE) dev-run-wary
	cd 6_compound_square; $(MAKE) dev-run-none; $(MAKE) dev-run-constant; $(MAKE) dev-run-linear; $(MAKE) dev-run-combi; $(MAKE) dev-run-wary
	cd 7_compound_square_random; $(MAKE) dev-run-none; $(MAKE) dev-run-constant; $(MAKE) dev-run-linear; $(MAKE) dev-run-combi; $(MAKE) dev-run-wary

none:
	cd 1_const; $(MAKE) dev-run-none
	cd 2_linear; $(MAKE) dev-run-none
	cd 3_square; $(MAKE) dev-run-none
	cd 4_random; $(MAKE) dev-run-none
	cd 5_compound; $(MAKE) dev-run-none
	cd 6_compound_square; $(MAKE) dev-run-none
	cd 7_compound_square_random; $(MAKE) dev-run-none

constant:
	cd 1_const; $(MAKE) dev-run-constant
	cd 2_linear; $(MAKE) dev-run-constant
	cd 3_square; $(MAKE) dev-run-constant
	cd 4_random; $(MAKE) dev-run-constant
	cd 5_compound; $(MAKE) dev-run-none
	cd 6_compound_square; $(MAKE) dev-run-none
	cd 7_compound_square_random; $(MAKE) dev-run-none

linear:
	cd 1_const; $(MAKE) dev-run-linear
	cd 2_linear; $(MAKE) dev-run-linear
	cd 3_square; $(MAKE) dev-run-linear
	cd 4_random; $(MAKE) dev-run-linear
	cd 5_compound; $(MAKE) dev-run-none
	cd 6_compound_square; $(MAKE) dev-run-none
	cd 7_compound_square_random; $(MAKE) dev-run-none

combi:
	cd 1_const; $(MAKE) dev-run-combi
	cd 2_linear; $(MAKE) dev-run-combi
	cd 3_square; $(MAKE) dev-run-combi
	cd 4_random; $(MAKE) dev-run-combi
	cd 5_compound; $(MAKE) dev-run-none
	cd 6_compound_square; $(MAKE) dev-run-none
	cd 7_compound_square_random; $(MAKE) dev-run-none

wary:
	cd 1_const; $(MAKE) dev-run-wary
	cd 2_linear; $(MAKE) dev-run-wary
	cd 3_square; $(MAKE) dev-run-wary
	cd 4_random; $(MAKE) dev-run-wary
	cd 5_compound; $(MAKE) dev-run-none
	cd 6_compound_square; $(MAKE) dev-run-none
	cd 7_compound_square_random; $(MAKE) dev-run-none

clean-all: $(WORKFLOWS)

$(WORKFLOWS):
	$(MAKE) clean -C $@
