function stoneGameVI(aliceValues: number[], bobValues: number[]): number {
  const fused = aliceValues
    .map((n, i) => [n + bobValues[i], n, bobValues[i]])
    .sort((a, b) => b[0] - a[0])

  let a = 0
  let b = 0
  for (let i = 0; i < fused.length; i += 2) {
    a += fused[i][1]
  }
  for (let i = 1; i < fused.length; i += 2) {
    b += fused[i][2]
  }

  return a > b ? 1 : a < b ? -1 : 0
}
