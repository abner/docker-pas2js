FROM spritsail/busybox 

RUN mkdir -p /opt/

RUN wget ftp://ftpmaster.freepascal.org/fpc/contrib/pas2js/1.4.26/pas2js-linux-1.4.26.zip -O /tmp/pas2js-linux-1.4.26.zip && \
  unzip /tmp/pas2js-linux-1.4.26.zip -d  /opt/ && \
  rm /tmp/pas2js-linux-1.4.26.zip && \
  mv /opt/pas2js-linux-1.4.26 /opt/pas2js && \
  rm -rf /opt/pas2js/demo && \
  ln -s /opt/pas2js/bin/pas2js /usr/bin/pas2js


ADD pas2js.cfg /opt/pas2js/bin/pas2js.cfg

ENV PAS2JS_TARGET=nodejs PAS2JS_INPUT_NAME=script.pas

VOLUME ["/tmp", "/opt/pas2js/dist"]

RUN ls /opt/pas2js/

CMD /opt/pas2js/bin/pas2js "-T$PAS2JS_TARGET" -FE/opt/pas2js/dist/ /opt/pas2js/src/$PAS2JS_INPUT_NAME
