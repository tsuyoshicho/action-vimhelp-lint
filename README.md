# GitHub Action: Run vim-vimhelplint with reviewdog

[![Docker Image CI](https://github.com/tsuyoshicho/action-vimhelp-lint/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/tsuyoshicho/action-vimhelp-lint/actions)
[![Release](https://github.com/tsuyoshicho/action-vimhelp-lint/workflows/release/badge.svg)](https://github.com/tsuyoshicho/action-vimhelp-lint/releases)

Vim help lint using [machakann/vim-vimhelplint](https://github.com/machakann/vim-vimhelplint).

__WIP Project__

## action-vimhelp-lint

Check Vim help (/doc)

## Inputs

### `github_token`

**Required**. Default is `${{ github.token }}`.

### `level`

Optional. Report level for reviewdog [info,warning,error].
It's same as `-level` flag of reviewdog.

### `reporter`

Reporter of reviewdog command [github-pr-check,github-check,github-pr-review].
Default is github-pr-review.
It's same as `-reporter` flag of reviewdog.

github-pr-review can use Markdown and add a link to rule page in reviewdog reports.

### `filter_mode`

Optional. Filtering mode for the reviewdog command [added,diff_context,file,nofilter].
Default is added.

### `fail_on_error`

Optional.  Exit code for reviewdog when errors are found [true,false]
Default is `false`.

### `reviewdog_flags`

Optional. Additional reviewdog flags

### `basedir`

help file base directory (i.e. `doc`)
Default: `doc`.

## Example usage

Set workflow into vim plugin.

### workflow file

```yml
name: "vim help lint"
on: push
jobs:
  vimhelplint:
    name: runner / vimhelplint
    runs-on: ubuntu-latest
    steps:
      - name: checkout
        uses: actions/checkout@v1
      - name: lint help
        uses: tsuyoshicho/action-vimhelp-lint@v1
        with:
          reporter: github-pr-review
          basedir: "doc"
```

## License

[CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/)
