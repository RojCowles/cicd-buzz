#!/bin/sh
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
TRAVIS_REPO_SLUG=`echo $TRAVIS_REPO_SLUG | tr '[:upper:]' '[:lower:]'`

echo $TRAVIS_REPO_SLUG

docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
docker push $TRAVIS_REPO_SLUG
