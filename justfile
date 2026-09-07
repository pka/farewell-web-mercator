# https://pandoc.org/MANUAL.html#slide-shows

SLIDE_OPTIONS := "-t revealjs --css=./custom.css --slide-level=2 -s"

# Generate HTML from markdown
html:
	test slides.md -ot docs/index.html || pandoc {{SLIDE_OPTIONS}} slides.md -o docs/index.html; sed -i 's|reveal.js@^4//|reveal.js@^5/|g' docs/index.html

# Update HTML when slides.md changes
watch: html
	fswatch -o --event Updated slides.md | xargs -I{} sh -c "echo Rebuilding...; pandoc {{SLIDE_OPTIONS}} slides.md -o docs/index.html"

# Open HTML in browser
open:
	xdg-open docs/index.html

# Build HTML for all tags
build-tags:
	git tag | xargs -I{} sh -c "git checkout {}; pandoc {{SLIDE_OPTIONS}} slides.md -o docs/index.html; sed -i 's|reveal.js@^4//|reveal.js@^5/|g' docs/index.html; mkdir -p docs/{}; mv docs/index.html docs/{}/index.html; ln -sf ../images docs/{}/images; ln -sf ../custom.css docs/{}/custom.css"
	git checkout main && just html
