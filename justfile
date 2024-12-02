# https://pandoc.org/MANUAL.html#slide-shows

SLIDE_OPTIONS := "-t revealjs --css=./custom.css --slide-level=2 -s"

# Generate HTML from markdown
html:
	test slides.md -ot docs/index.html || pandoc {{SLIDE_OPTIONS}} slides.md -o docs/index.html

# Update HTML when slides.md changes
watch: html
	fswatch -o --event Updated slides.md | xargs -I{} sh -c "echo Rebuilding...; pandoc {{SLIDE_OPTIONS}} slides.md -o docs/index.html"

# Open HTML in browser
open:
	xdg-open docs/index.html
