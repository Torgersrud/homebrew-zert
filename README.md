# homebrew-zert

Homebrew tap for [zert](https://github.com/Torgersrud/zert-cli), the customer
CLI for the zert sandbox service.

## Install

```sh
brew tap Torgersrud/zert
brew install zert
```

## Updating the formula

Run from the zert-cli repo after publishing a release tag:

```sh
scripts/bump-homebrew.sh v0.1.1 /path/to/homebrew-zert
```

It sets the new `url` + `sha256` in `Formula/zert.rb`, commits and pushes.
