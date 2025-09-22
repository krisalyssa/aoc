package main

import "testing"

func TestPart1(t *testing.T) {
	cases := []struct {
		data     string
		expected int
	}{}

	for _, c := range cases {
		got := part1(c.data)
		if got != c.expected {
			t.Errorf("part1(%#v) == %#v, want %#v", c.data, got, c.expected)
		}
	}
}

func TestPart2(t *testing.T) {
	cases := []struct {
		data     string
		expected int
	}{}

	for _, c := range cases {
		got := part2(c.data)
		if got != c.expected {
			t.Errorf("part2(%#v) == %#v, want %#v", c.data, got, c.expected)
		}
	}
}
