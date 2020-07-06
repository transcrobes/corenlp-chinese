# vim:set ft=dockerfile:
FROM openjdk:14-slim

RUN apt update && apt -y install wget libarchive-tools && apt -y autoremove && apt -y clean && rm -rf /var/lib/apt/lists/* 

ARG CORENLP_VERSION='4.0.0'

RUN wget -qO- "http://nlp.stanford.edu/software/stanford-corenlp-${CORENLP_VERSION}.zip" | bsdtar -xvf-

RUN wget -q http://nlp.stanford.edu/software/stanford-corenlp-${CORENLP_VERSION}-models-chinese.jar -O stanford-corenlp-${CORENLP_VERSION}/stanford-corenlp-${CORENLP_VERSION}-models-chinese.jar

WORKDIR stanford-corenlp-${CORENLP_VERSION}

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV CORENLP_TIMEOUT=30000
ENV CORENLP_JAVA_XMX=300m
ENV CORENLP_PORT=9001

EXPOSE $CORENLP_PORT

CMD java -Xmx${CORENLP_JAVA_XMX} -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port $CORENLP_PORT -timeout ${CORENLP_TIMEOUT} -serverProperties StanfordCoreNLP-chinese.properties
