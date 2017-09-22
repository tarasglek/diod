# docker run -d --rm --name diod -v `pwd`:/export -p 127.0.0.1:564:564 tarasglek/diod
# sudo mount -t 9p -n 127.0.0.1 /mnt     -oaname=/export,version=9p2000.L,uname=root,access=user,port=10564
# ssh config:
# Host foo
#     LocalForward 127.0.0.1:10564 127.0.0.1:564
FROM debian:stretch
RUN apt update && apt install diod -y && rm -rf /var/lib/apt/lists/*
COPY run.sh /run.sh 
ENV LISTEN 0.0.0.0:564
ENV EXPORT_DIR /export
CMD /run.sh