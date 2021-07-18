# Gradescope uses Ubuntu 18.04 as the base image.
FROM gradescope/auto-builds

# Set container metadata.
LABEL MAINTAINER="Dani Roxberry <dani@makeschool.com>"
LABEL VERSION="1.0"

# Configure Go version.
# Defaults to 1.13.7 unless overridden via `docker build`.
ARG GOLANG_VERSION=1.13.7

# Install Go and create directory structure.
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq -y && apt-get install -qq build-essential wget openssh-server < /dev/null > /dev/null
RUN cd /tmp && \
    wget -q https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    tar -xf go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    mv go /usr/local && \
    mkdir $HOME/go && \
    export GOROOT=/usr/local/go && \
    export GOPATH=$HOME/go && \
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Copy run_autograder file to the container.
COPY run_autograder /autograder/run_autograder

# Run the autograder script.
CMD ["/autograder/run_autograder"]

