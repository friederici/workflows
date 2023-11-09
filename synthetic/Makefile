
WORKFLOWS := $(wildcard */.)

.PHONY: dev prod clean-all $(WORKFLOWS)

dev:
	$(MAKE) -f makefile.dev

prod:
	$(MAKE) -f makefile.prod

clean-all: $(WORKFLOWS)

$(WORKFLOWS):
	$(MAKE) clean -C $@
