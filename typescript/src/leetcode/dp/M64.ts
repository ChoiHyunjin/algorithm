function minPathSum(grid: number[][]): number {
  const dp: number[][] = [[]]
  for (let i = 0; i < grid[0].length; i++) {
    dp[0][i] = grid[0][i] + (dp[0].at(i - 1) ?? 0)
  }

  for (let i = 1; i < grid.length; i++) {
    dp[i] = [grid[i][0] + dp[i - 1][0]]
    for (let j = 1; j < grid[0].length; j++) {
      dp[i][j] = grid[i][j] + Math.min(dp[i - 1][j], dp[i][j - 1])
    }
  }

  return dp.at(-1)?.at(-1) ?? 0
}
