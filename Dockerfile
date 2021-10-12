# vim:set ft=dockerfile:
FROM openjdk:15-slim

RUN apt update && apt -y install wget libarchive-tools && apt -y autoremove && apt -y clean && rm -rf /var/lib/apt/lists/* 

ARG CORENLP_VERSION='4.2.2'

# Stanford can't afford decent servers/bandwidth apparently...
RUN wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 --tries=100 -O- "https://nlp.stanford.edu/software/stanford-corenlp-${CORENLP_VERSION}.zip" | bsdtar -xvf-

RUN wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 --tries=100 http://nlp.stanford.edu/software/stanford-corenlp-${CORENLP_VERSION}-models-chinese.jar -O stanford-corenlp-${CORENLP_VERSION}/stanford-corenlp-${CORENLP_VERSION}-models-chinese.jar

WORKDIR stanford-corenlp-${CORENLP_VERSION}

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV CORENLP_TIMEOUT=30000
ENV CORENLP_JAVA_XMX=700m
ENV CORENLP_PORT=9001
ENV CORENLP_CHINESE_SEGMENTER=ctb.small.gz
ENV CORENLP_THREADS=2

EXPOSE $CORENLP_PORT

CMD java -Xmx${CORENLP_JAVA_XMX} -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port $CORENLP_PORT -timeout ${CORENLP_TIMEOUT} -serverProperties StanfordCoreNLP-chinese.properties -segment.model edu/stanford/nlp/models/segmenter/chinese/$CORENLP_CHINESE_SEGMENTER -threads $CORENLP_THREADS
