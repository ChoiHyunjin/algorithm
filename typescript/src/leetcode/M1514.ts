function maxProbability(
  n: number,
  edges: number[][],
  succProb: number[],
  start_node: number,
  end_node: number,
): number {
  const map = new Array<number[]>(n)
  for (let i = 0; i < n; i++) {
    map[i] = new Array<number>(n).fill(0)
    map[i][i] = 1
  }
  edges.forEach(([n1, n2], i) => {
    map[n1][n2] = succProb[i]
    map[n2][n1] = succProb[i]
  })

  const set = new Set<number>()
  set.add(start_node)

  while (set.size < n) {
    let maxIndex = -1
    map[start_node].forEach((v, i) => {
      if (set.has(i)) {
        return
      }
      maxIndex = v > (map[start_node][maxIndex] ?? 0) ? i : maxIndex
    })
    if (maxIndex < 0) {
      break
    }
    set.add(maxIndex)
    for (let i = 0; i < n; i++) {
      map[start_node][i] = Math.max(
        map[start_node][i],
        map[start_node][maxIndex] * map[maxIndex][i],
      )
    }
  }

  return map[start_node][end_node]
}

function maxProbability2(
  n: number,
  edges: number[][],
  succProb: number[],
  start_node: number,
  end_node: number,
): number {
  const map = new Array<number[]>(n)
  for (let i = 0; i < n; i++) {
    map[i] = new Array<number>(n).fill(0)
    map[i][i] = 1
  }
  edges.forEach(([n1, n2], i) => {
    map[n1][n2] = succProb[i]
    map[n2][n1] = succProb[i]
  })

  const updateMap = (i: number, j: number) => {
    let res = map[i][j]
    for (let k = 0; k < n; k++) {
      res = Math.max(map[i][k] * map[k][j], res)
    }
    if (res > map[i][j]) {
      map[i][j] = res
      map[j][i] = res
      for (let k = 0; k < n; k++) {
        updateMap(k, i)
        updateMap(k, j)
      }
    }
  }
  // update
  for (let i = 0; i < n; i++) {
    updateMap(start_node, i)
    updateMap(end_node, i)
  }

  return map[start_node][end_node]
}
