function combinationSum2(candidates: number[], target: number): number[][] {
  const sorted = candidates.sort((a, b) => a - b)
  const res: number[][] = []

  const getCombination = (start: number, t: number, current: number[]) => {
    if (t === 0) {
      res.push([...current])
      return
    }

    for (let i = start; i < sorted.length; i += 1) {
      if (i > start && sorted[i] === sorted[i - 1]) {
        continue
      }
      if (sorted[i] > t) {
        break
      }
      current.push(sorted[i])
      getCombination(i + 1, t - sorted[i], current)
      current.pop()
    }
  }

  getCombination(0, target, [])

  return res
}
