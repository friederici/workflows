
WORKFLOWS := $(wildcard */.)

.PHONY: clean-all $(WORKFLOWS)

clean-all: $(WORKFLOWS)

$(WORKFLOWS):
	$(MAKE) clean -C $@

