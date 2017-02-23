#! /bin/bash
set -o errexit
set -o pipefail

# Bash Script: report_failure_details.sh
# Purpose: To report the failure details of a build directly to Slack.
# Requirements: Add this script in travis.yml after_failure to add failure detail Slack notifications.

# Only alert failure details on commits to master
if [ "$TRAVIS_PULL_REQUEST" == false ] && [ "$TRAVIS_BRANCH" == "master" ]; then
  COLOR="#ce0814"
  BUILD_URL="https://travis-ci.com/$TRAVIS_REPO_SLUG/builds/$TRAVIS_BUILD_ID"
  STATUS_TITLE="$TRAVIS_REPO_SLUG <$BUILD_URL|$TRAVIS_BUILD_NUMBER> failure details:"
  STATUS_TITLE_FALLBACK="$TRAVIS_REPO_SLUG $TRAVIS_BUILD_NUMBER failure:"
  STATUS_MESSAGE=""

  # If a -debug error logfile is present and non-empty, parse for error and add to message

  # Check for npm errors
  if [ -s "npm-debug.log" ]; then
    STATUS_MESSAGE+="NPM ERROR\n"
    STATUS_MESSAGE+="$(sed -n -e "/error code/,\$p" npm-debug.log)"
  fi

  # Check for bower errors
  if [ -s "bower-debug.log" ]; then
    STATUS_MESSAGE+="BOWER ERROR\n"
    STATUS_MESSAGE+="$(sed -n -e "/error details/,\$p" bower-debug.log)"
  fi

  # Check for unit test errors
  if [ -s "wct.log" ]; then
    STATUS_MESSAGE+="UNIT TEST ERROR\n"
    STATUS_MESSAGE+="$(sed -n -e "/✖/,\$p" wct.log)"
  fi

  # If at least one of the failure logs was not empty, send the error details to Slack
  if [[ ! -z "$STATUS_MESSAGE" ]]; then
    STATUS_MESSAGE="\`\`\`$STATUS_MESSAGE\`\`\`"

    echo -e "$STATUS_TITLE"
    echo -e "$STATUS_MESSAGE"
    #Teflon Slack notification (uses https://ldschurch.slack.com/services/122760792000)
    curl -X POST --data-urlencode 'payload={ "username": "TravisBot", "text": "'"$STATUS_TITLE"'", "mrkdwn": true, "attachments": [{ "fallback": "'"$STATUS_TITLE_FALLBACK"'", "color": "'"$COLOR"'", "mrkdwn_in": ["text"], "text": "'"$STATUS_MESSAGE"'" }]}' https://hooks.slack.com/services/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
  fi
fi
