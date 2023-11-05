
WORKFLOWS := $(wildcard */.)

.PHONY: clean-all $(WORKFLOWS)

all:
	@echo use make clean-all to cleanup

clean-all: $(WORKFLOWS)

$(WORKFLOWS):
	$(MAKE) clean -C $@

