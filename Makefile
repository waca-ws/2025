SHELL := /bin/bash
BUNDLE := bundle
JEKYLL := $(BUNDLE) exec jekyll

.PHONY: all install update clean build serve

all: install build

editions: $(editions)

install: 
	$(BUNDLE) config --global silence_root_warning 1
	$(BUNDLE) config --global disable_platform_warnings true
	$(BUNDLE) install

update: 
	$(BUNDLE) update

clean: 
	$(JEKYLL) clean

build: 
	$(JEKYLL) build

serve:
	$(JEKYLL) serve
