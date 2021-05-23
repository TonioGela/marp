# build presentation
build:
    marp --html true --theme-set ./theme/toniogela.css -- slides.md
# build presentation as pdf
pdf:
    marp --html true --theme-set ./theme/toniogela.css --pdf --allow-local-files -- slides.md

# build theme (useful if scss gets changed)
theme:
    sass --no-source-map theme/toniogela.scss:theme/toniogela.css