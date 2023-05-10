FROM debian:latest

# install dependency
RUN apt-get update && apt-get install curl -y

# setting of working directory used installing openjdk
WORKDIR /

# install openjdk using binary published in web
# if this link can not use you must customize this link and PATH setting
RUN curl -O "https://download.java.net/java/GA/jdk20.0.1/b4887098932d415489976708ad6d1a4b/9/GPL/openjdk-20.0.1_linux-x64_bin.tar.gz"
RUN tar -xf /openjdk-20.0.1_linux-x64_bin.tar.gz

# check directory name which extracted and has openjdk
RUN ls

# setting of PATH which used to install clojure
ENV PATH="${PATH}:/jdk-20.0.1/bin"

# test whether can use java command or not
#RUN java -h

# install leiningen script
WORKDIR /usr/local/bin
RUN curl -O "https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein"
RUN chmod a+x lein
# setup leiningen
RUN lein
# add this lein script to PATH
ENV PATH="${PATH}:/usr/local/bin"

# change to /usr/src/project
WORKDIR /usr/src/project
