FROM golang:buster
RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update && apt-get install make git

RUN mkdir /sqldef && git -C /sqldef init

WORKDIR /sqldef

ARG VERSION

RUN git remote add origin https://github.com/k0kubun/sqldef && \
	git fetch origin --depth=1 "${VERSION:-master}" && \
	git reset --hard FETCH_HEAD

RUN export GOPATH=/go/; \
	export GOBIN=$HOME/bin; \
	make all && sh -ec "mv build/*/mysqldef /usr/bin/ && mv build/*/psqldef /usr/bin/ && mv build/*/sqlite3def /usr/bin/"

COPY docker-entrypoint.sh .

ENTRYPOINT [ "/sqldef/docker-entrypoint.sh" ]
