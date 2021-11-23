# GitHub Action: Lint vim help format

<!--
[![Docker Image CI](https://github.com/tsuyoshicho/action-vimhelp-tagname-check/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/tsuyoshicho/action-vimhelp-tagname-check/actions)
[![Release](https://github.com/tsuyoshicho/action-vimhelp-tagname-check/workflows/release/badge.svg)](https://github.com/tsuyoshicho/action-vimhelp-tagname-check/releases)
-->

## action-vimhelp-lint

Check Vim help (/doc)

## Inputs

none.

## Example usage

Set workflow into vim plugin.

### workflow file

```yml
name: "vim help lint"
on: push
jobs:
  tagname:
    name: Lint vim help format
    runs-on: ubuntu-latest
    steps:
      - name: checkout
        uses: actions/checkout@v1
      - name: lint help
        uses: tsuyoshicho/action-vimhelp-lint@v1
```

## License

[CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/)
