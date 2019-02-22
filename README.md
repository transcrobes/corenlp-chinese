# CoreNLP-English

This repo creates and releases standard images of Stanford's CoreNLP with the standard Chinese model.

Documentation
=============
The repo will build and release to the Gitlab registry for the current project (e.g., `registry.gitlab.com/transcrobes/corenlp-english`) and one other external registry (like Dockerhub, e.g., `transcrobes/corenlp-english`) when a tag is pushed to Gitlab. The default docker tags for a commit are to bump `latest` and to tag this latest with the first 8-chars of the git tagged commit, in addition to tagging with the git tag. By convention the git tag should correspond to the CoreNLP release (e.g., `3.9.2`).

To push a new version of CoreNLP, simply update the repo's `Dockerfile` with the date of the new CoreNLP release (which corresponds to the new release, e.g., `2018-10-05` corresponds to CoreNLP release `3.9.2`), push the commit, git tag, push the git tag to Gitlab. The build will then build and push to both Gitlab's and the external Docker registry.

See https://transcrob.es for information about how Stanford's CoreNLP is used in Transcrobes.

See https://stanfordnlp.github.io/CoreNLP/ for information on Stanford's CoreNLP itself.

## Build Configuration

Gitlab CI also requires the following CI ENV variables:

`EXT_REG_REGISTRY`: Docker registry (e.g., docker.io for Dockerhub)

`EXT_REG_ORGANISATION`: First level of image tag name (i.e, the 'Organisation' for Dockerhub, e.g., `transcrobes`)

`EXT_REG_USER`: External registry username

`EXT_REG_PASSWORD`: External registry user's password

These should be set at the project or group level.

## Run Configuration

Three ENV variables can be set to control the running CoreNLP process and should be passed to `docker run` (or to Kubernetes, etc.):

`TIMEOUT`: Default 30000 (milliseconds)

`JAVA_XMX`: Default 300m (megabytes)

`PORT`: Default listen 9000 

## Contributing

See [the Transcrobes website](https://transcrob.es/page/contribute) for more information. Please also take a look at our [code of conduct](https://transcrob.es/page/code_of_conduct) (or CODE\_OF\_CONDUCT.md in this repo).

## External Open Source code used in/by this repo and licences

This repo contains code/resources for building and pushing Docker container images of Stanford's CoreNLP running on openjdk:11-jre-slim base images. It does not directly include any of the code from those projects.
