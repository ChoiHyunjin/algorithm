function prevPermOpt1(arr: number[]): number[] {
  if (arr.length === 1) {
    return arr
  }
  const res = [...arr]
  const indexMap: { [key: number]: number } = {} // {value: index}

  for (let i = arr.length - 1; i > 0; i -= 1) {
    indexMap[arr[i]] = i
    if (arr[i] >= arr[i - 1]) {
      continue
    }

    const keys = Object.keys(indexMap).map((v) => parseInt(v))
    const largestValue = keys.reduce((prev, curr) => {
      if (prev > curr || curr >= arr[i - 1]) {
        return prev
      }
      return curr
    }, -1)
    const index = indexMap[largestValue]
    if (largestValue < 0) {
      break
    }

    const temp = res[index]
    res[index] = res[i - 1]
    res[i - 1] = temp
    break
  }

  return res
}
