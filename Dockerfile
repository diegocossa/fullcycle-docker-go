#compile
FROM golang:alpine AS build

WORKDIR /app

COPY . .

RUN go build -ldflags '-s -w' main.go


#exec
FROM scratch

WORKDIR /

COPY --from=build /app /

CMD ["./main"]
