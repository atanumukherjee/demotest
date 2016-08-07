FROM centos:latest
ADD test.sh /
RUN chmod +x /test.sh
#CMD "Hello World!"
CMD ["/bin/sh","/test.sh"]
ENTRYPOINT ./test.sh
