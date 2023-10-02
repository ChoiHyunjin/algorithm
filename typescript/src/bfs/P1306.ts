// BFS
function canReach(arr: number[], start: number): boolean {
  const bfs: number[] = []
  const visited = {}

  bfs.push(start)
  while (bfs.length > 0) {
    let idx = bfs.shift()!
    if (!!visited[idx]) {
      continue
    }
    visited[idx] = true

    if (arr[idx] === 0) {
      return true
    }

    if (idx - arr[idx] >= 0) {
      bfs.push(idx - arr[idx])
    }
    if (idx + arr[idx] < arr.length) {
      bfs.push(idx + arr[idx])
    }
  }

  return false
}

// DFS
function canReach2(arr: number[], start: number): boolean {
  const visited = {}

  function dfs(idx: number): boolean {
    if (idx < 0 || idx >= arr.length || visited[idx]) {
      return false
    }
    if (arr[idx] === 0) {
      return true
    }

    let result = false

    visited[idx] = true

    result = dfs(idx - arr[idx])
    if (!result) {
      result = dfs(idx + arr[idx])
    }

    return result
  }

  return dfs(start)
}
