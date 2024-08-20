function minSteps(n: number): number {
  let dp = [0, 0]

  const getPrimeFactors = (num: number) => {
    const limit = Math.floor(num ** (1 / 2))
    const res = new Set<number>([])
    for (let i = 2; i <= limit; i++) {
      const modulo = num % i
      if (modulo > 0) {
        continue
      }
      res.add(i)
      res.add(num / i)
    }
    return res
  }

  for (let i = 2; i <= n; i++) {
    const factors = getPrimeFactors(i)
    const candidates = [i]
    factors.forEach((f) => {
      candidates.push(dp[f] + i / f)
    })
    dp[i] = Math.min(...candidates)
  }

  return dp[n]
}
