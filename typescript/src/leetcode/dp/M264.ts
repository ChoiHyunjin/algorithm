function nthUglyNumber(n: number): number {
  const nums = [2, 3, 5]
  const candidates = new Set([1])
  const res = [1]

  while (res.length <= n) {
    const arr = Array.from(candidates)
    const num = Math.min(...arr)
    res.push(num)
    candidates.delete(num)
    nums.forEach((a) => {
      candidates.add(num * a)
    })
  }

  return res.at(-1) ?? 1
}
