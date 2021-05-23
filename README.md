# Marp Presentations Template

![example](./images/example.png)

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

# TODO
Add CI and autodeploy on Netlify