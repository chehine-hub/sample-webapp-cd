FROM jenkins/jenkins
USER root
RUN apt-get update && \
apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
apt-get update && \
apt-get -y install docker-ce docker-ce-cli containerd.io && \
usermod -aG docker jenkins
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose
RUN wget https://github.com/aquasecurity/trivy/releases/download/v0.18.3/trivy_0.18.3_Linux-64bit.deb && \
dpkg -i trivy_0.18.3_Linux-64bit.deb
RUN VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/') && \
curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64 && \
chmod +x /usr/local/bin/argocd
COPY --chown=jenkins:jenkins ./deploy-vm /opt/deploy-vm 
RUN chmod 400 /opt/deploy-vm
USER jenkins

