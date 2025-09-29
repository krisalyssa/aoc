import { Command } from '@commander-js/extra-typings'
import { access, constants, existsSync } from 'fs'
import * as path from 'path'

const program = new Command()
  .name('day')
  .option('-1, --part1', 'run only part 1')
  .option('-2, --part2', 'run only part 2')
  .option('-v, --verbose', 'increase output (use multiple times for more output)', increaseVerbose, 0)
  .argument('<day')

program.parse(process.argv)

const options = program.opts()

// global variables
let day: number | undefined
let runPart1 = true
let runPart2 = true
let verbose: number = (options.verbose === true ? 1 : options.verbose)

if (options.part1) {
  runPart1 = true
  runPart2 = false
} else if (options.part2) {
  runPart1 = false
  runPart2 = true
}

const num = Number(program.args[0])
if (Number.isInteger(num) && (num >= 1) && (num <= 25)) {
  day = num
} else {
  program
    .addHelpText('beforeAll', `
<day> must be a number between 1 and 25, inclusive
`)
    .help({ error: true })
}

if (day === undefined) {
  // set day to current day of the month?
  program
    .addHelpText('beforeAll', `
<day> is required
`)
    .help({ error: true })
}

const moduleName = dayModule(day!)
access(`${moduleName}.ts`, constants.R_OK, (err) => {
  if (err) {
    program
      .addHelpText('beforeAll', `
${moduleName}.ts not found
`)
      .help({ error: true })
  } else {
    if (verbose >= 2) {
      console.log(`loading module ${moduleName}`)
    }

    const dayCode = require(moduleName)

    if (!runPart2) {
      if (verbose >= 1) {
        console.log(`running code for day ${day} part 1`)
      }

      dayCode.runPart1()
    } else if (!runPart1) {
      if (verbose >= 1) {
        console.log(`running code for day ${day} part 2`)
      }

      dayCode.runPart2()
    } else {
      if (verbose >= 1) {
        console.log(`running code for day ${day}`)
      }

      dayCode.run()
    }
  }
})

function appDir() {
  let dir = __dirname
  while (!existsSync(path.join(dir, 'package.json'))) {
    dir = path.dirname(dir)
  }
  return dir
}

function dayModule(day: number, rootDir = appDir()) {
  const dayWithLeadingZeros = String(day).padStart(2, '0')
  return path.join(rootDir, 'days', dayWithLeadingZeros)
}

function increaseVerbose(_: any, previousValue: number) {
  return previousValue + 1
}

function usage(exitCode: number = 1) {
  console.log('usage: index.ts [ -p1 | -p2 ] <day>')
  process.exit(exitCode)
}
