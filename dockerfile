FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli

USER jenkins

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false" 
ENV JENKINS_OPTS="--prefix=/jenkins"

VOLUME /var/jenkins_home


EXPOSE 8080
EXPOSE 50000