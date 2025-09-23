package main

import (
	"fmt"

	"github.com/rs/zerolog/log"
)

var version = "undefined"

func main() {
	fmt.Println("kotest:", version)
	fmt.Println("kotest2:", version)
	log.Info().Msg("hello world")
}
