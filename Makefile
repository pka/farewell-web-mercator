# https://pandoc.org/MANUAL.html#slide-shows

SLIDE_OPTIONS=-t revealjs --css=./custom.css --slide-level=2 -s

all: docs/index.html

docs/index.html: slides.md
	pandoc $(SLIDE_OPTIONS) $< -o $@

watch: docs/index.html
	fswatch -o --event Updated slides.md | xargs -I{} sh -c "echo Rebuilding...; pandoc $(SLIDE_OPTIONS) slides.md -o docs/index.html"

open:
	xdg-open docs/index.html
