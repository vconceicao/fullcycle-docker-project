# Step 1: Build the Go binary
FROM golang AS builder

WORKDIR /app
COPY . .

# Ensure Go modules are used correctly
RUN go mod init myapp && \
    go mod tidy

# Enable static linking for a fully independent binary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o myapp .

# Step 2: Use "scratch" for a zero-dependency final image
FROM scratch
COPY --from=builder /app/myapp /myapp

CMD ["/myapp"]
