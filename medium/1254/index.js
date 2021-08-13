/**
 * @param {number[][]} grid
 * @return {number}
 */
var closedIsland = function (grid) {
  let count = 0

  let isEnd = false

  while (!isEnd) {
    let notEdge = true
    const stack = []
    const start = getStartPoint(grid)
    if (start[0] < 0) isEnd = true
    else {
      stack.push(start)
      while (stack.length > 0) {
        const [x, y] = stack.pop()
        notEdge = pushNearLand(grid, x, y, stack) && notEdge
      }
      if (notEdge) count += 1
    }
  }
  return count
}

function getStartPoint(grid) {
  let notFound = true
  let y = 1
  let x = 1
  for (y = 1; y < grid.length - 1 && notFound; ) {
    for (x = 1; x < grid[0].length - 1 && notFound; ) {
      if (grid[y][x] === 0) {
        notFound = false
      } else {
        x += 1
      }
    }
    if (grid[y][x] === 0) {
      notFound = false
    } else {
      y += 1
    }
  }
  return notFound ? [-1, -1] : [x, y]
}

function pushNearLand(grid, x, y, stack) {
  grid[y][x] = 2
  let notEdge = x > 0 && x < grid[0].length - 1 && y > 0 && y < grid.length-1
  checkUp(grid, x, y, stack)
  checkLeft(grid, x, y, stack)
  checkDown(grid, x, y, stack)
  checkRight(grid, x, y, stack)
  return notEdge
}

function checkUp(grid, x, y, stack) {
  if (y >= 1 && grid[y - 1][x] === 0) {
    stack.push([x, y - 1])
  }
}

function checkLeft(grid, x, y, stack) {
  if (x + 1 < grid[0].length && grid[y][x + 1] === 0) {
    stack.push([x + 1, y])
  }
}

function checkDown(grid, x, y, stack) {
  if (y + 1 < grid.length && grid[y + 1][x] === 0) {
    stack.push([x, y + 1])
  }
}

function checkRight(grid, x, y, stack) {
  if (x >= 1 && grid[y][x - 1] === 0) {
    stack.push([x - 1, y])
  }
}

export default closedIsland






