function numMagicSquaresInside(grid: number[][]): number {
  let res = 0

  const isMagical = (r: number, c: number) => {
    if (grid[r + 1][c + 1] !== 5) {
      return false
    }
    const set = new Set()
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        const num = grid[r + i][c + j]
        if (set.has(num) || num < 1 || num > 9) {
          return false
        }
        set.add(num)
      }
    }

    for (let i = 0; i < 3; i++) {
      let sum = 0
      for (let j = 0; j < 3; j++) {
        sum += grid[r + i][c + j]
      }
      if (sum !== 15) {
        return false
      }
    }

    for (let i = 0; i < 3; i++) {
      let sum = 0
      for (let j = 0; j < 3; j++) {
        sum += grid[r + j][c + i]
      }
      if (sum !== 15) {
        return false
      }
    }

    if (grid[r][c] + grid[r + 2][c + 2] !== 10) {
      return false
    }

    if (grid[r + 2][c] + grid[r][c + 2] !== 10) {
      return false
    }

    return true
  }

  for (let i = 0; i < grid.length - 2; i++) {
    for (let j = 0; j < grid[0].length - 2; j++) {
      res += isMagical(i, j) ? 1 : 0
    }
  }

  return res
}
