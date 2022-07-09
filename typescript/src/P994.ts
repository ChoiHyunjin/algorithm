// @ts-ignore
const directions = [
  [1, 0],
  [0, 1],
  [-1, 0],
  [0, -1],
]

enum Status {
  Empty,
  Fresh,
  Rotten,
}

function posToStr(x: number, y: number) {
  return `${x} ${y}`
}

function strToPos(pos: string) {
  return pos.split(' ').map((p) => parseInt(p))
}

function orangesRotting(grid: number[][]): number {
  let res = 0
  let map: number[][] = []
  let queue: Set<string> = new Set()

  let counter = 0
  let goalCounter = 0

  for (let y = 0; y < grid.length; y += 1) {
    map[y] = [...grid[y]]
    for (let x = 0; x < grid[0].length; x += 1) {
      if (grid[y][x] === Status.Empty) {
        continue
      }
      goalCounter += 1

      if (grid[y][x] === Status.Fresh) {
        continue
      }

      counter += 1
      queue.add(posToStr(x, y))
    }
  }

  function spread(x: number, y: number) {
    const result: string[] = []

    for (const dir of directions) {
      const newX = x + dir[0]
      const newY = y + dir[1]
      if (newX < 0 || newX >= map[0].length || newY < 0 || newY >= map.length) {
        continue
      }
      if (map[newY][newX] !== Status.Fresh) {
        continue
      }
      result.push(posToStr(newX, newY))
      map[newY][newX] = Status.Rotten
      counter += 1
    }

    return result
  }

  while (queue.size > 0) {
    res += 1
    const newQueue: Set<string> = new Set()
    queue.forEach((item) => {
      const pos = strToPos(item)
      const items = spread(pos[0], pos[1])
      items.forEach((i) => newQueue.add(i))
    })
    queue = newQueue
  }

  return counter === goalCounter ? Math.max(0, res) : -1
}
