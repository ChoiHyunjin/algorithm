function lexicalOrder(n: number): number[] {
  const res = Array(n)

  let value = 1
  for (let i = 0; i < n; i++) {
    while (value > n) {
      value = Math.floor(value / 10) + 1
      while (value % 10 === 0) {
        value = value / 10
      }
    }

    res[i] = value
    value *= 10
  }

  return res
}
