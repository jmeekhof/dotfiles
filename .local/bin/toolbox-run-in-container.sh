#!/bin/bash

set -o errexit
set -o nounset

PROGRAM="$(basename "$0")"
CONTAINER="$(readlink $0 | sed 's/toolbox-//')"

if [ "$(basename "$(realpath "$0")")" = "${PROGRAM}" ]; then
  echo "can't run ${PROGRAM} via ${PROGRAM}" >&2
  exit
fi

PROGRAM="$(
  # Remove this script's directory from PATH; this assumes that you'll never want
  # to run a sibling via this script.
  dir="$(dirname "$0")"
  PATH="$(echo "${PATH}" | sed "s+:${dir}:++")"
  PATH="$(echo "${PATH}" | sed "s+${dir}:++")"
  PATH="$(echo "${PATH}" | sed "s+:${dir}++")"
  command -v "${PROGRAM}"
)"

ARGS=(run)

if ! [ "$CONTAINER" == "base" ]; then
  ARGS=("${ARGS[@]}" --container "$CONTAINER")
fi

ARGS=("${ARGS[@]}" "$PROGRAM")

toolbox "${ARGS[@]}" $*
