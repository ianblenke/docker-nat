#!/bin/bash -e
if [[ $TRAVIS_BRANCH == 'master' && $TRAVIS_PULL_REQUEST == 'false' ]]; then
  docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
  set -x
  docker push ${TRAVIS_REPO_SLUG}:latest
  docker tag ${TRAVIS_REPO_SLUG}:latest ${TRAVIS_REPO_SLUG}:${TRAVIS_BUILD_NUMBER} 
  docker push ${TRAVIS_REPO_SLUG}:${TRAVIS_BUILD_NUMBER}
fi
