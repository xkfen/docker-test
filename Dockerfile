FROM golang
MAINTAINER katy
WORKDIR /go/src/
COPY . .
RUN chmod 755 /go/src/go-build.sh
EXPOSE 80
CMD ["/bin/bash", "/go/src/go-build.sh"]