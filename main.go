package main

import (
	"log"
	"os"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/logger"
)

func main() {
	app := fiber.New()

	// Logger middleware
	app.Use(logger.New())

	// Static folder path
	staticDir := "./static"
	if len(os.Args) > 1 {
		staticDir = os.Args[1]
	}

	// Serve static files
	app.Static("/", staticDir)

	// Catch-all route to serve index.html for SPA
	app.Get("/*", func(c *fiber.Ctx) error {
		return c.SendFile(staticDir + "/index.html")
	})

	// Start server
	port := os.Getenv("PORT")
	if port == "" {
		port = "3000"
	}

	log.Printf("Server starting on port %s, serving files from %s", port, staticDir)
	log.Fatal(app.Listen(":" + port))
}
