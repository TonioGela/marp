# Marp Presentations Template

![example](./images/example.png)

## Prerequisites
On MacOsX
```
brew install marp-cli
(Optionally)
brew install sass/sass/sass
brew install just
brew install monolith
```

On Linux
```
npm install -g @marp-team/marp-cli
(Optionally)
npm install -g sass
cargo install just
cargo install monolith
```

## Instructions
This template requires [marp](https://marp.app/) to be installed to be built.
`npm install -g @marp-team/marp-cli` or `brew install marp-cli`

The file `toniogela.scss` should be compiled to css using [sass](https://sass-lang.com/install) with `sass --no-source-map toniogela.scss:toniogela.css`.
The repository already contains compiled version for ease. The theme contains just a few overrides over the default [uncover](https://github.com/marp-team/marp-core/blob/main/themes/uncover.scss) theme, that is heavily inspired by [reveal.js](https://revealjs.com/), tool that I often use in its [reveal-md](https://github.com/webpro/reveal-md) form.

You can build the presentation using `marp --html true --theme-set ./theme/toniogela.css -- slides.md`.

### justfile
The repository contains a `justfile` for [just](https://github.com/casey/just). You can see the list of recipres using `just --list`, but the idea is that you can build the presentation using `just build`

## Customization

[slides.md](./slides.md) and [toniogela.scss](./theme/toniogela.scss) should contain all customization instructions

### Graphs
Cool graphs can be drawn using [Asciiflow](https://asciiflow.com/#/) and [converted to images](https://shaky.github.bushong.net/)

## Bundling
To bundle the whole presentation as a file you can use [monolith](https://github.com/Y2Z/monolith) (or `just deploy` if you're using just).

Sadly marp generates some selectors that are using a CSS hack for IE 9 that monolith doesn't detect (see [here](https://github.com/Y2Z/monolith/issues/258) for info) so it's necessary to use `sed` to modify the output file.

The syntax for sed in-place is `sed -i 's/<x>/<y>/g' <file>` on linux while `sed -i '' 's/<x>/<y>/g' <file>` on MacOsX. In the justfile you find `sed -i 's/:not()/:not(\\9)/g' index.html` since I personally aliased `gsed` installable via `brew install gnu-sed` to `sed`.

## Vscode

To use [the preview feature of vscode](https://github.com/marp-team/marp-vscode#preview-marp-markdown) set the following properties:
```
"markdown.marp.themes": ["./theme/toniogela.css"],
"markdown.marp.enableHtml": true
```

note that a `.vscode/settings.json` is committed in the repo for ease.

## Other

The [Marp Github discussions](https://github.com/marp-team/marp/discussions) are the best place for info.

For the list of emojis see [here](https://github.com/markdown-it/markdown-it-emoji/blob/2.0.0/lib/data/full.json)

For a comparison with Deckset see [here](https://github.com/marp-team/marp/discussions/68)

# TODO (Contributors are welcome)
Add CI and autodeploy on Netlify, maybe using [action-netlify-deploy](https://github.com/South-Paw/action-netlify-deploy#deploying-drafts-on-each-commit-and-publishing-on-push-to-master)

[Runners](https://github.com/TonioGela/base.g8/settings/actions/runners) are a good fit? Probably not but [Custom Docker Images](https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action)? Maybe built with [this rationale](https://www.lpalmieri.com/posts/fast-rust-docker-builds/) i.e. keeping the image as small as possible?