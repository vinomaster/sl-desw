#!/bin/bash
# Process and render slideshow source in slides.md using reveal.js
docker run -p 8000:8000 -t -i -d -v `pwd`:/revealjs/md parente/revealjs
