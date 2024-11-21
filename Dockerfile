FROM golang

# Set a build-time variable
ARG DB=memdb

# Set the working directory for the app
WORKDIR /go/src/github.com/ucy-coast/hotel-app

# Copy all the files to the container
COPY . .

# Build and install the monolith app
RUN go mod init github.com/ucy-coast/hotel-app
RUN go mod tidy
RUN go build -tags ${DB} -o /app/mono ./cmd/mono

# Set the entrypoint for the container
ENTRYPOINT ["/app/mono"]

# Expose the port the application listens on
EXPOSE 8080

