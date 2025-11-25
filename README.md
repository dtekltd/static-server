# Static Server

A simple Go server using Fiber to serve static files with SPA routing support.

## Features

- Serves static files from a directory
- Catch-all routing for Single Page Applications (SPAs)
- Configurable port via PORT environment variable
- Configurable static directory via command line argument

## Installation

```bash
go mod download
```

## Usage

Run with default settings (serves `./static` on port 3000):

```bash
go run main.go
```

Serve a custom directory:

```bash
go run main.go /path/to/your/static/folder
```

Set a custom port:

```bash
PORT=8080 go run main.go
```

## Build

```bash
go build -o statics-server
./statics-server
```
