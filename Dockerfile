FROM golang:1.21 as builder

ENV ROOT=/go/src/app

WORKDIR ${ROOT}
COPY . .

RUN go mod tidy
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /go/bin/app ./app/main.go

FROM gcr.io/distroless/static-debian11

COPY --from=builder /go/bin/app /

USER 1100:1100

CMD ["/app"]
