
WORKFLOWS := $(wildcard */.)

.PHONY: dev prod clean-all $(WORKFLOWS)

dev:
	$(MAKE) -f makefile.dev

prod:
	$(MAKE) -f makefile.prod

prod-none:
	$(MAKE) -f makefile.prod none

clean-all: $(WORKFLOWS)

$(WORKFLOWS):
	$(MAKE) clean -C $@
