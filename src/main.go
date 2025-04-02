package main

import (
	"flag"
	"fmt"
	"os"
)

func main() {

	mode := flag.String("mode", "default", "Mode to run the application in (e.g. smtp)")

	flag.Parse()

	fmt.Println("Script mode:", *mode)
	fmt.Println("SMTP Host:", os.Getenv("SMTP_HOST"))
	fmt.Println("SMTP Port:", os.Getenv("SMTP_PORT"))
	fmt.Println("SMTP Email:", os.Getenv("SMTP_EMAIL"))
	fmt.Println("SMTP Password:", os.Getenv("SMTP_PASSWORD"))
	fmt.Println("SMTP Receiver:", os.Getenv("SMTP_RECEIVER"))
}
