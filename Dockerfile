#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts
ADD deploy /root/deploy
ADD root/script.sh /root/script.sh
ADD root/.netrc /root/.netrc


# Install Node
RUN \
  curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
  sudo apt-get install -y nodejs

# Install IBM Toolkit Apiconnect
RUN npm install -g apiconnect

RUN chmod +x /root/script.sh
RUN chmod 600 /root/.netrc

# Install IBM Toolkit Apiconnect Licencia
# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

#RUN bash -x script.sh

#ENTRYPOINT ["apic", "yes", "no"]


# Define default command.
CMD ["bash"]