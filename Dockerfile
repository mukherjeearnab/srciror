##############################
# Building the Mutator Image
# Use an official Ubuntu runtime as a parent image
FROM ubuntu:18.04

# Set the working directory in the container
WORKDIR /src-master

# Copy the current directory contents into the container workdir
COPY . /src-master

# install required packages
RUN apt-get update && apt-get install -y --no-install-recommends wget unzip ca-certificates build-essential python python3 clang lib32z1-dev

# install the llvm modules
RUN bash llvm-build.sh

# go to SRCMutator and build it.
RUN cd SRCMutation && make

# Run ls as of now, since not much to do here
CMD ["ls"]
