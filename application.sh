#!/bin/sh

cd /deployments

# Get parameters from environment

if [ -z $ACTIVE_PROFILE ]
then
    echo "ACTIVE_PROFILE environment variable must exist!"
    exit 1
fi

if [ -z $JASYPT_PASSWORD ]
then
    echo "JASYPT_PASSWORD environment variable must exist!"
    exit 1
fi

# Start application

JAVA_OPTIONS="$JAVA_OPTIONS -Dspring.profiles.default=$ACTIVE_PROFILE -Dspring.profiles.active=$ACTIVE_PROFILE"
JAVA_OPTIONS="$JAVA_OPTIONS -Dlogging.file=application.log"
JAVA_OPTIONS="$JAVA_OPTIONS -Djava.net.preferIPv4Stack=true -Djava.awt.headless=true"
JAVA_OPTIONS="$JAVA_OPTIONS -Djasypt.encryptor.password=$JASYPT_PASSWORD $OTHER_JAVA_OPTIONS"

if [ ! -z $SERVER_PORT ]
then
        JAVA_OPTIONS="$JAVA_OPTIONS -Dserver.port=$SERVER_PORT"
else
        JAVA_OPTIONS="$JAVA_OPTIONS -Dserver.port=8080"
fi

JAVA_OPTIONS="$JAVA_OPTIONS $(/opt/jolokia/jolokia-opts)"

export JAVA_OPTIONS

echo "Starting the Java application using /opt/run-java/run-java.sh ..."
exec /opt/run-java/run-java.sh
