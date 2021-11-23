#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ] ; then
  cd "${GITHUB_WORKSPACE}" || exit
fi

# export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

# setup vim-vimhelplint
export VIMHELPLINT_PATH="${GITHUB_WORKSPACE}/vim-vimhelplint"
rm -rf "${VIMHELPLINT_PATH}"
git clone --depth 1 https://github.com/machakann/vim-vimhelplint "${VIMHELPLINT_PATH}"

find doc \( -name "*.txt" -or -name "*.??x"  \) -type f -print0 | xargs  -0 -I {} \
vim -esN --cmd "set rtp+=${VIMHELPLINT_PATH}" \
  -c "filetype plugin on"   \
  -c "e {}" \
  -c "verb VimhelpLintEcho" \
  -c q
# # shellcheck disable=SC2086
#     | reviewdog -efm="%f:%l:%c:%trror: %m"                                        \
#                 -efm="%f:%l:%c:%tarning: %m"                                      \
#                 -efm="%f:%l:%c:%m"                                                \
#       -name="${INPUT_TOOL_NAME}"                                                  \
#       -reporter="${INPUT_REPORTER:-github-pr-review}"                             \
#       -filter-mode="${INPUT_FILTER_MODE}"                                         \
#       -fail-on-error="${INPUT_FAIL_ON_ERROR}"                                     \
#       -level="${INPUT_LEVEL}"                                                     \
#       ${INPUT_REVIEWDOG_FLAGS}
