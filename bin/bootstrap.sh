#!/usr/bin/env bash

set -e

GITHUB_USER="alessio-libardi-zupit"
GITHUB_REPO="dotfiles"

BASEDIR="${HOME}/.config/${GITHUB_REPO}"

git clone https://github.com/"${GITHUB_USER}"/"${GITHUB_REPO}".git --recursive "${BASEDIR}"

bash "${BASEDIR}/bin/update.sh"
