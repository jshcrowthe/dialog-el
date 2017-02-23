#! /bin/bash
set -o errexit
set -o pipefail

# Bash Script: tag_build.sh
# Purpose: To tag a successful build and create a semver tag any time the bower version is updated.
# Requirements: Add this script in travis.yml after_success to add the build number and semver tags in GitHub.

# Only create new build tags on commits to master
if [ "$TRAVIS_PULL_REQUEST" == false ] && [ "$TRAVIS_BRANCH" == "master" ]; then
  git fetch
  git reset --hard "$TRAVIS_COMMIT"

  BOWER_VERSION="$(cat bower.json \
    | grep version \
    | head -1 \
    | awk -F: '{ print $2 }' \
    | sed 's/[",]//g' \
    | tr -d '[:space:]')"

  # If there is no tag/release for the current bower version, create one
  if [ -z "$(git tag -l "$BOWER_VERSION")" ]; then

    git tag -a "$BOWER_VERSION" -m "Travis CI auto bower version update" -m "$(git log --format=%B -n 1 "$TRAVIS_COMMIT")" "$TRAVIS_COMMIT"

    echo -e "created semver tag: $BOWER_VERSION"
  fi

  git push origin --tags

  # TODO: Webhook/integration to automatically consume the new component version by either pushing an empty commit to https://github.com/fs-webdev/component-catalog or forcing a Heroku rebuild (https://github.com/heroku/legacy-cli/issues/514#issuecomment-237604006)
fi
