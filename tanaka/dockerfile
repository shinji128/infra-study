FROM golang:1.23-alpine AS go
WORKDIR /app
ADD go.mod go.sum main.go ./
RUN go build -o main /app/main.go
CMD /app/main
