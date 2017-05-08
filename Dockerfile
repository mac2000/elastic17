FROM openjdk:nanoserver
MAINTAINER Alexandr Marchenko <marchenko.alexandr@gmail.com>

ENV CLUSTER_NAME elastic17
ENV NODE_NAME elastic17

EXPOSE 9200
EXPOSE 9300

RUN powershell -Command "Invoke-WebRequest -Uri https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.1.zip -OutFile C:\elasticsearch-1.7.1.zip; Expand-Archive C:\elasticsearch-1.7.1.zip C:\; Remove-Item C:\elasticsearch-1.7.1.zip"

RUN .\elasticsearch-1.7.1\bin\plugin -i analysis-morphology -url http://dl.bintray.com/content/imotov/elasticsearch-plugins/org/elasticsearch/elasticsearch-analysis-morphology/1.2.1/elasticsearch-analysis-morphology-1.2.1.zip
RUN .\elasticsearch-1.7.1\bin\plugin -i mobz/elasticsearch-head
RUN .\elasticsearch-1.7.1\bin\plugin -i elasticsearch/marvel/latest

COPY ./config/ ./elasticsearch-1.7.1/config/

CMD ["C:/elasticsearch-1.7.1/bin/elasticsearch.bat"]
