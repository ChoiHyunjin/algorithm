const directions = [
  [1, 0],
  [0, 1],
  [-1, 0],
  [0, -1],
]

function updateMatrix(mat: number[][]): number[][] {
  const res: number[][] = []
  let queue: Set<string> = new Set()
  let counter = 0

  for (let y = 0; y < mat.length; y += 1) {
    res[y] = []
    for (let x = 0; x < mat[y].length; x += 1) {
      res[y][x] = -1
      if (mat[y][x] !== 0) {
        continue
      }
      res[y][x] = 0
      queue.add(`${x} ${y}`)
      counter += 1
    }
  }

  let value = 1

  function spread(x: number, y: number) {
    const result: string[] = []
    for (const dir of directions) {
      const newX = x + dir[0]
      const newY = y + dir[1]
      if (newX < 0 || newX >= mat[0].length || newY < 0 || newY >= mat.length) {
        continue
      }

      if (res[newY][newX] > -1) {
        continue
      }
      res[newY][newX] = value
      counter += 1
      result.push(`${newX} ${newY}`)
    }
    return result
  }

  while (queue.size > 0 && counter < mat.length * mat[0].length) {
    console.log('map:', res)
    const newQueue: Set<string> = new Set()
    queue.forEach((item) => {
      const pos = item.split(' ').map((p) => parseInt(p))
      const items = spread(pos[0], pos[1])
      items.forEach((item) => newQueue.add(item))
    })
    queue = newQueue
    value += 1
  }

  return res
}
