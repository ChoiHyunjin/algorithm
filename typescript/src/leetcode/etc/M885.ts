function spiralMatrixIII(
  rows: number,
  cols: number,
  rStart: number,
  cStart: number,
): number[][] {
  const directions = [
    [0, 1],
    [1, 0],
    [0, -1],
    [-1, 0],
  ]
  const corners = [
    [rStart, cStart + 1],
    [rStart + 1, cStart + 1],
    [rStart + 1, cStart - 1],
    [rStart - 1, cStart - 1],
  ]
  const cornerWeights = [
    [-1, 1],
    [1, 1],
    [1, -1],
    [-1, -1],
  ]
  const res: number[][] = []

  const isInRange = (r: number, c: number) => {
    return r >= 0 && r < rows && c >= 0 && c < cols
  }

  let ptr = [rStart, cStart]
  if (isInRange(rStart, cStart)) {
    res.push([...ptr])
  }

  let diff = Math.max(rStart, cStart, rows - rStart - 1, cols - cStart - 1)

  for (let i = 0; i <= diff; i += 1) {
    directions.forEach((dir, j) => {
      const corner = corners[j]
      while (true) {
        ptr[0] += dir[0]
        ptr[1] += dir[1]

        if (isInRange(ptr[0], ptr[1])) {
          res.push([...ptr])
        }
        if (ptr[0] === corner[0] && ptr[1] === corner[1]) {
          break
        }
      }

      const cornerWeight = cornerWeights[j]
      corner[0] += cornerWeight[0]
      corner[1] += cornerWeight[1]
    })
  }

  return res
}
