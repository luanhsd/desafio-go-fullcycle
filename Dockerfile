FROM golang:1.20-alpine as builder

WORKDIR /usr/src/app

LABEL stage=copy
COPY . .

RUN go build fullcycle.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app .

ENTRYPOINT [ "./fullcycle" ]