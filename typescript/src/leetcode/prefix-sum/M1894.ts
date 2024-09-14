function chalkReplacer(chalk: number[], k: number): number {
  let prefix = Array<number>(chalk.length + 1)
  prefix[0] = 0
  let res = -1
  for (let i = 0; i < chalk.length; i++) {
    prefix[i + 1] = prefix[i] + chalk[i]
    if (prefix[i + 1] > k) {
      res = i
      break
    }
  }

  if (res >= 0) {
    return res
  }
  const modulo = k % prefix[chalk.length]
  for (let i = 0; i < chalk.length; i++) {
    if (prefix[i + 1] > modulo) {
      res = i
      break
    }
  }

  return res
}

function chalkReplacer2(chalk: number[], k: number): number {
  let sum = chalk.reduce((p, c) => p + c, 0)
  let modulo = k % sum
  let res = 0

  chalk.some((c, i) => {
    if (c > modulo) {
      res = i
      return true
    }
    modulo -= c
    return false
  })

  return res
}
