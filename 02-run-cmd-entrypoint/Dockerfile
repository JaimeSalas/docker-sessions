FROM ubuntu:20.04

USER root 

# /bin/sh -c apt update 
# SHELL FORM
# RUN apt update  
# RUN apt install --yes software-properties-common 
# RUN add-apt-repository ppa:deadsnakes/ppa 
# RUN apt install --yes python3.8

# EXEC FORM
RUN ["apt", "update"]  
RUN ["apt", "install", "--yes", "software-properties-common"] 
RUN ["add-apt-repository", "ppa:deadsnakes/ppa"] 
RUN ["apt", "install", "--yes", "python3.8"]

ENV name Pepe

CMD ["/usr/bin/echo", "Hello world CMD"]
# # /bin/sh -c echo "Hello world ${name}" 
# ENTRYPOINT ["bin/bash", "-c", "echo Hello world, ${name}"]
ENTRYPOINT ["echo", "Hello world, ${name}"]

# CMD echo "Hello world"
