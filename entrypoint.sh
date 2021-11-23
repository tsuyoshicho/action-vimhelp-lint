#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ] ; then
  cd "${GITHUB_WORKSPACE}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

# setup vim-vimhelplint
export VIMHELPLINT_PATH="${GITHUB_WORKSPACE}/vim-vimhelplint"
rm -rf "${VIMHELPLINT_PATH}"
git clone --depth 1 https://github.com/machakann/vim-vimhelplint "${VIMHELPLINT_PATH}"

export RESULT_LOG=result.txt
touch "${RESULT_LOG}"
find "${INPUT_BASEDIR}" \( -name "*.txt" -or -name "*.??x" \) -type f -print0 \
  | xargs -0 -I {} vim --clean --not-a-term \
    --cmd "set rtp+=${VIMHELPLINT_PATH}" \
      -c "filetype plugin on"            \
      -c "e {}"                          \
      -c "verb VimhelpLintEcho"          \
      -c q >> "${RESULT_LOG}"

# shellcheck disable=SC2086
cat "${RESULT_LOG}" | reviewdog                       \
      -efm="=%f:%l:%c:%trror:%n:%m"                   \
      -efm="%f:%l:%c:%tarning:%n:%m"                  \
      -name="${INPUT_TOOL_NAME}"                      \
      -reporter="${INPUT_REPORTER:-github-pr-review}" \
      -filter-mode="${INPUT_FILTER_MODE}"             \
      -fail-on-error="${INPUT_FAIL_ON_ERROR}"         \
      -level="${INPUT_LEVEL}"                         \
      ${INPUT_REVIEWDOG_FLAGS}
