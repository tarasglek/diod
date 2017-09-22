# docker run --rm --name diod -v `pwd`:/export -p 564:564 diod
FROM debian:stretch
RUN apt update && apt install diod -y && rm -rf /var/lib/apt/lists/*
COPY run.sh /run.sh 
ENV LISTEN 0.0.0.0:564
ENV EXPORT_DIR /export
CMD /run.sh