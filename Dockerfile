FROM image-registry.openshift-image-registry.svc:5000/localhost/adoptopenjdk-jre-11.0.6-alpine

ENV APP_NAME='lets-coding-config-server-app' \
    JAVA_APP_DIR="/deployments" \
    JAVA_APP_JAR="lets-coding-config-server-app.jar" \
    JAVA_MAJOR_VERSION="11" \
    TZ="Europe/Istanbul"

RUN curl -o /deployments/${APP_NAME}.jar ${ARTIFACT_URL} --insecure

USER 1000

RUN chown avivasa:avivasa /deployments/${APP_NAME}.jar
COPY --chown=avivasa:avivasa ./application.sh /deployments/application.sh

CMD ["sh", "/deployments/application.sh"]
