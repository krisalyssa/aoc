package main

import (
	util "aoc"
	"fmt"
	"log"
)

func main() {
	data, err := util.ReadFile("../data/20.txt")
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf(`{
  %q: [
    %#v,
    %#v
  ]
}`, "day_20", part1(data[0]), part2(data[0]))

}

func part1(_ string) int {
	return 0
}

func part2(_ string) int {
	return 0
}
