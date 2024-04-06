# prints this list
default:
  @just --list --unsorted

# builds the presentation
build:
    marp slides.md

# builds, watches for changes and opens a live preview window
preview:
    marp --preview slides.md

# builds the presentation as pdf (requires Chrome or Edge)
pdf:
    marp --pdf -- slides.md

# builds the theme from scss (useful if scss gets changed)
theme:
    sass --no-source-map theme/toniogela.scss:theme/toniogela.css

# removes temp build files
clean:
    rm -f slides.html index.html

# creates a single self-contained easy-to-deploy index.html file
bundle: build
    monolith slides.html --silent --output index.html 