FROM node:latest

ENV HOME /data
WORKDIR /data

EXPOSE 3000

RUN set -ex;                                \
    chmod a+w /data;                        \   
    npm install -g json-server;
RUN set -xe;                                \
    groupadd -g 1001 jsonserver;            \
    useradd -u 1001 -g 1001 -m jsonserver;  \
    chown -R jsonserver:jsonserver /data

RUN set -ex;                                \
    chmod a+w /data;                        \   
    npm install json-concat --save;	
	
## ADD run.sh /run.sh
COPY run.sh /run.sh
RUN chmod +x /run.sh
USER 1001
ENTRYPOINT ["bash", "/run.sh"]
