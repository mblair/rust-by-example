default:: build

SRCDIR=src
DESTDIR=artifacts
GITROOT=$(shell git rev-parse --show-toplevel)
SRCS = $(wildcard $(GITROOT)/$(SRCDIR)/*.rs)
OBJS = $(basename $(notdir $(SRCS)))
-ALL_OBJS=$(shell find $(DESTDIR) -type f)

build: $(OBJS)

clean:
	rm -f $(ALL_OBJS)

rustfmt:
	rustfmt --write-mode=overwrite $(SRCS)

$(OBJS): %: $(DESTDIR)/%

$(DESTDIR)/%:
	mkdir -p $(DESTDIR)
	-rustc --out-dir=$(DESTDIR) $(SRCDIR)/$*.rs
