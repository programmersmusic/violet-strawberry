#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e5a22b9800282001b056dda/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e5a22b9800282001b056dda
curl -s -X POST https://api.stackbit.com/project/5e5a22b9800282001b056dda/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e5a22b9800282001b056dda/webhook/build/publish > /dev/null
