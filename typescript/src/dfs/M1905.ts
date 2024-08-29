const directions = [
  [0, 1],
  [0, -1],
  [1, 0],
  [-1, 0],
]

function countSubIslands(grid1: number[][], grid2: number[][]): number {
  let count = 0

  const n = grid1.length
  const m = grid1[0].length
  const isInRange = (i: number, j: number) => {
    return 0 <= i && i < n && 0 <= j && j < m
  }

  const islands: [number, number][][] = []
  const dfs = (
    i: number,
    j: number,
    island: [number, number][] = [],
  ): [number, number][] => {
    island.push([i, j])
    grid2[i][j] = 0
    directions.forEach((dir) => {
      const r = i + dir[0]
      const c = j + dir[1]

      if (!isInRange(r, c)) {
        return
      }
      if (grid2[r][c] === 0) {
        return
      }
      return dfs(r, c, island)
    })
    return island
  }

  for (let i = 0; i < n; i++) {
    for (let j = 0; j < m; j++) {
      if (grid2[i][j] === 0) {
        continue
      }
      const island = dfs(i, j)
      if (island.length > 0) {
        islands.push(island)
      }
    }
  }
  islands.forEach((island) => {
    count += island.every(([r, c]) => grid1[r][c] === 1) ? 1 : 0
  })

  return count
}
