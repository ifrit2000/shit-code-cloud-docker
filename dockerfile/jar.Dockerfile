FROM cd871127/java11.consul1.8.0
MAINTAINER Anthony

RUN mkdir -p /app/config

COPY app.jar /app

CMD java -jar app.jar
