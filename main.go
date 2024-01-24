package main

import "github.com/gin-gonic/gin"

// main creates a new instance of http server using gin framework and starts it.
func main() {

	gin.SetMode(gin.ReleaseMode)

	r := gin.New()
	r.Use(gin.Logger())
	r.Use(gin.Recovery())
	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Hello World!",
		})
	})

	r.Run(":8080")
}
