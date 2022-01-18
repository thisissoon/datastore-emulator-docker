# Version. Can change in build progress
ARG GCLOUD_SDK_VERSION=367.0.0-alpine

# Use google cloud sdk
FROM google/cloud-sdk:$GCLOUD_SDK_VERSION

# Install Java 17 for Datastore emulator
RUN apk add --update --no-cache openjdk17-jre --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
# Install Datastore emulator
RUN gcloud components install cloud-datastore-emulator beta --quiet

# Volume to persist Datastore data
VOLUME /opt/data

COPY start-datastore .

EXPOSE 8081

ENTRYPOINT ["./start-datastore"]
