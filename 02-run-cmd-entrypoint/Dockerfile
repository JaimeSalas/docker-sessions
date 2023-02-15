FROM ubuntu:20.04

USER root 

# /bin/sh -c apt update 
RUN apt update  
RUN apt install --yes software-properties-common 
RUN add-apt-repository ppa:deadsnakes/ppa 
RUN apt install --yes python3.8

CMD 
