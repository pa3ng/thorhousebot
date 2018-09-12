FROM target/flottbot:golang

ADD config config

CMD ["/go/flottbot"]