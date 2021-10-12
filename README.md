# CoreNLP-English

This repo creates standard images of Stanford's CoreNLP with the default Chinese model.

Documentation
=============

See https://transcrob.es for information about how Stanford's CoreNLP is used in Transcrobes.

See https://stanfordnlp.github.io/CoreNLP/ for information on Stanford's CoreNLP itself.

## Run Configuration

Three ENV variables can be set to control the running CoreNLP process and should be passed to `docker run` (or to Kubernetes, etc.):

`TIMEOUT`: Default 30000 (milliseconds)

`JAVA_XMX`: Default 700m (megabytes)

`PORT`: Default listen 9001 

`CORENLP_CHINESE_SEGMENTER`: Default ctb.gz, can also be pku.gz for pku or ctb.small.gz for a memory reduced Chinese Treebank version

`CORENLP_THREADS`: Default 2, number of java threads for the process

## Contributing

See [the Transcrobes website](https://transcrob.es/page/contribute) for more information. Please also take a look at our [code of conduct](https://transcrob.es/page/code_of_conduct) (or CODE\_OF\_CONDUCT.md in this repo).

## External Open Source code used in/by this repo and licences

This repo contains code/resources for building and pushing Docker container images of Stanford's CoreNLP running on openjdk:15-slim base images. It does not directly include any of the code from those projects.
