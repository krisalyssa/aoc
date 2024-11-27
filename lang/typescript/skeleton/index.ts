import { existsSync } from "fs"
import * as path from "path"

function appDir() {
	let dir = __dirname;
	while (!existsSync(path.join(dir, "package.json"))) {
		dir = path.dirname(dir);
	}
	return dir;
}

function dayModule(day: number, rootDir = appDir()) {
	const dayWithLeadingZeros = String(day).padStart(2, "0");
	return path.join(rootDir, "days", dayWithLeadingZeros);
}

function usage(exitCode: number = 1) {
  console.log("usage: index.ts [ -p1 | -p2 ] <day>")
  process.exit(exitCode)
}

// global variables
let day: number | undefined
let runPart1 = true
let runPart2 = true

// remove the equivalent of argv[0]
const args = process.argv.slice(2)

for (const a of args) {
  const arg = a.trim()

  if (arg === "--help" || arg === "-h" || arg === "-?") {
    usage(0)
  } else if (arg === "--part1" || arg === "-p1") {
    runPart1 = true
    runPart2 = false
  } else if (arg === "--part2" || arg === "-p2") {
    runPart1 = false
    runPart2 = true
  } else {
    const num = Number(arg)
    if (Number.isInteger(num) && (num >= 1) && (num <= 25)) {
      day = num
    } else {
      usage()
    }
  }
}

if (day === undefined) {
  // set day to current day of the month?
  usage()
}

console.log(`loading module ${dayModule(day!)}`)
const dayCode = require(dayModule(day!))

if (!runPart2) {
  console.log(`running code for day ${day} part 1`)
  dayCode.runPart1()
} else if (!runPart1) {
  console.log(`running code for day ${day} part 2`)
  dayCode.runPart2()
} else {
  console.log(`running code for day ${day}`)
  dayCode.run()
}
