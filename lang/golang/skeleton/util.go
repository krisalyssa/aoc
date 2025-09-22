package util

import (
	"bufio"
	"os"
)

func ReadFile(filename string) ([]string, error) {
	file, err := os.Open(filename)
	if err != nil {
		return []string{}, err
	}
	defer file.Close()

	var data []string

	scanner := bufio.NewScanner(file)

	// optionally, resize scanner's capacity for lines over 64K
	// const maxCapacity int = longLineLen  // your required line length
	// buf := make([]byte, maxCapacity)
	// scanner.Buffer(buf, maxCapacity)

	for scanner.Scan() {
		data = append(data, scanner.Text())
	}

	return data, scanner.Err()
}
