FROM golang:1.23-alpine AS build

WORKDIR /app
COPY go.mod go.sum* ./
RUN go mod download

COPY . .
RUN set -eux; \
    if [ -d cmd ]; then \
      for entrypoint in cmd/*; do \
        if [ -d "$entrypoint" ]; then go build -o /tmp/backend-report "./$entrypoint"; break; fi; \
      done; \
    else \
      go build -o /tmp/backend-report .; \
    fi

FROM alpine:3.20

WORKDIR /app
RUN addgroup -S app && adduser -S app -G app

COPY --from=build /tmp/backend-report /app/backend-report

USER app
ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["/app/backend-report"]
