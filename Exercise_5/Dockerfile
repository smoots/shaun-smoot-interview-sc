FROM jenkins/jenkins
USER root

# Install PreReqs
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
  && rm -rf /var/lib/apt/lists/*


# Install Terraform
RUN wget --quiet https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip \
  && unzip terraform_0.12.24_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_0.12.24_linux_amd64.zip

EXPOSE 8080/tcp
