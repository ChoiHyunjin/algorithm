function combinationSum3(k: number, n: number): number[][] {
  const res: number[][] = []
  const getCombination = (values: number[], count: number, t: number) => {
    if (values.length === count - 1 && t < 10) {
      res.push([...values, t])
      return
    } else if (values.length > count - 1) {
      return
    }

    for (let i = values.at(-1) ?? 0; i + 1 < t - (i + 1) && i < 9; i += 1) {
      getCombination([...values, i + 1], count, t - (i + 1))
    }
  }
  getCombination([], k, n)

  return res
}
