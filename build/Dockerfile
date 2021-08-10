FROM adoptopenjdk/openjdk11
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]



#RUN curl -o /deployments/${APP_NAME}.jar ${ARTIFACT_URL} --insecure
#USER 1000
#RUN chown letscoding:letscoding /deployments/${APP_NAME}.jar
#COPY --chown=letscoding:letscoding ./application.sh /deployments/application.sh

#CMD ["sh", "/deployments/application.sh"]
