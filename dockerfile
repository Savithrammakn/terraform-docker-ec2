FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    git \
    curl

RUN wget https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip \
    && unzip terraform_1.6.6_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm terraform_1.6.6_linux_amd64.zip

WORKDIR /app


RUN git clone https://github.com/<Savithrammakn>/terraform-docker-ec2.git .

CMD ["sh", "-c", "terraform init && terraform apply -auto-approve"]
