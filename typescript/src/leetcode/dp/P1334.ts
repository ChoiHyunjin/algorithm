/**
 * 학습 포인트
 * Floyd-Warshall 알고리즘
 *
 * 링크: https://leetcode.com/problems/find-the-city-with-the-smallest-number-of-neighbors-at-a-threshold-distance/description/?envType=daily-question&envId=2024-07-26
 * @param n
 * @param edges
 * @param distanceThreshold
 * @returns
 */

function findTheCity(
  n: number,
  edges: [number, number, number][],
  distanceThreshold: number,
): number {
  let res = -1
  let map: number[][] = []
  for (let i = 0; i < n; i += 1) {
    map.push([])
    for (let j = 0; j < n; j += 1) {
      map[i][j] = i === j ? 0 : Infinity
    }
  }
  edges.forEach(([i, j, v]) => {
    map[i][j] = v
    map[j][i] = v
  })

  for (let k = 0; k < n; k += 1) {
    for (let i = 0; i < n; i += 1) {
      for (let j = 0; j < n; j += 1) {
        if (map[i][j] > map[i][k] + map[k][j]) {
          map[i][j] = map[i][k] + map[k][j]
        }
      }
    }
  }

  let reachable = Infinity
  for (let i = 0; i < n; i++) {
    let count = map[i].reduce((prev, curr) => {
      if (distanceThreshold >= curr) {
        return prev + 1
      }
      return prev
    }, 0)

    if (count <= reachable) {
      res = i
      reachable = count
    }
  }

  return res
}
