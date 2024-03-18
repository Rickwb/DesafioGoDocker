FROM golang:alpine as build

WORKDIR /go/src/app

COPY . .

RUN go build -o /app main.go

FROM scratch

COPY --from=build /app /go

CMD ["/go"]