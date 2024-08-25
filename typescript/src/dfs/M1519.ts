function countSubTrees(n: number, edges: number[][], labels: string): number[] {
  const nodes: number[][] = Array.from({ length: n }, () => [])
  const res: number[] = Array(n)
  const labelArr = Array.from(labels)

  edges.forEach(([e1, e2]) => {
    nodes[e1].push(e2)
    nodes[e2].push(e1)
  })

  const dfs = (n: number, parent?: number) => {
    const count = Array(26).fill(0) // 알파벳 개수만큼 배열 생성 ('a' ~ 'z')
    const labelIdx = labelArr[n].charCodeAt(0) - 'a'.charCodeAt(0)
    count[labelIdx] = 1

    nodes[n].forEach((child) => {
      if (child === parent) {
        return
      }
      dfs(child, n).forEach((c, i) => {
        count[i] = c + (count[i] ?? 0)
      })
    })
    res[n] = count[labelIdx]
    return count
  }

  dfs(0)

  return res
}
