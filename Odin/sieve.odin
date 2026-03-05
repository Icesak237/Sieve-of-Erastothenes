package main

import "core:fmt"
import "core:math"

N :: 1000

square_N: int = int(math.sqrt(f32(N)))

all: [N]bool


main :: proc() {
	all = true

	all[0] = false
	all[1] = false

	for i in 2 ..< square_N {
		if all[i] == true {
			for j := i; j * i <= N - 1; j += 1 {
				tester := i * j
				all[tester] = false
			}
		}
	}

	for i in 2 ..< N - 1 {
		if all[i] == true do fmt.println(i)
	}
}
