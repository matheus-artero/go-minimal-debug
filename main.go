package main

import (
	"fmt"
	"time"
)

func main() {
	var a, b string

	a = "valor"
	b = "outro valor"

	for {
		time.Sleep(2 * time.Second)
		fmt.Println("Running - test with remote debugger in dockerized go app", a, b)
	}
}
