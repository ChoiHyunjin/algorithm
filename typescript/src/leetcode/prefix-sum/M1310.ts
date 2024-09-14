function xorQueries(arr: number[], queries: number[][]): number[] {
  let prevXor = 0
  const prefixes = arr.map((n) => {
    const res = prevXor ^ n
    prevXor = res
    return res
  })
  prefixes.unshift(0)

  return queries.map(([l, r]) => {
    return prefixes[l] ^ prefixes[r + 1]
  })
}
