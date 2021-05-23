# prints this list
default:
  @just --list --unsorted

# build presentation
build:
    marp --html true --theme-set ./theme/toniogela.css -- slides.md
# build presentation as pdf
pdf:
    marp --html true --theme-set ./theme/toniogela.css --pdf --allow-local-files -- slides.md

# build theme (useful if scss gets changed)
theme:
    sass --no-source-map theme/toniogela.scss:theme/toniogela.css

# creates a single self contained index.html file
deploy: build
    monolith slides.html -o index.html &> /dev/null
    @sed -i 's/:not()/:not(\\9)/g' index.html