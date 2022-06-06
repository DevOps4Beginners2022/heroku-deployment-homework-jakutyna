FROM golang:1.17-alpine

WORKDIR /app

ARG PORT=8080
ENV PORT=$PORT

COPY go.mod ./
COPY go.sum ./
COPY main.go ./

RUN go mod download
RUN go build -o app-server

EXPOSE $PORT

CMD [ "./app-server" ]