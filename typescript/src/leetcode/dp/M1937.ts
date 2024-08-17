function maxPoints(points: number[][]): number {
  const dp: number[][] = [[]]

  const m = points.length
  const n = points[0].length
  for (let j = 0; j < n; j++) {
    dp[0][j] = points[0][j]
  }

  const toLeft: number[] = []
  const toRight: number[] = []
  for (let i = 1; i < m; i++) {
    dp[i] = []

    toRight[0] = dp[i - 1][0]
    for (let j = 1; j < n; j++) {
      toRight[j] = Math.max(dp[i - 1][j], toRight[j - 1] - 1)
    }
    toLeft[n - 1] = dp[i - 1][n - 1]
    for (let j = 1; j < n; j++) {
      toLeft[n - 1 - j] = Math.max(dp[i - 1][n - 1 - j], toLeft[n - j] - 1)
    }

    for (let j = 0; j < n; j++) {
      dp[i][j] = points[i][j] + Math.max(toRight[j], toLeft[j])
    }
    console.log('dp:', dp[i])
  }
  return Math.max(...dp[m - 1])
}
