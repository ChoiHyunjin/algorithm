function maxDistance(arrays: number[][]): number {
  const minIndexes: number[] = []
  const maxIndexes: number[] = []

  const getMin = (i: number) => arrays[i][0]
  const getMax = (i: number) => arrays[i].at(-1) ?? 0

  arrays.forEach((_, i) => {
    let minIndex = i
    let maxIndex = i
    for (let j = 0; j < 2; j++) {
      if (minIndexes[j] === undefined) {
        minIndexes[j] = minIndex
        break
      } else if (getMin(minIndexes[j]) > getMin(minIndex)) {
        const temp = minIndexes[j]
        minIndexes[j] = minIndex
        minIndex = temp
      }
    }
    for (let j = 0; j < 2; j++) {
      if (maxIndexes[j] === undefined) {
        maxIndexes[j] = maxIndex
        break
      } else if (getMax(maxIndexes[j]) < getMax(maxIndex)) {
        const temp = maxIndexes[j]
        maxIndexes[j] = maxIndex
        maxIndex = temp
      }
    }
  })

  let min = minIndexes[0]
  let max = maxIndexes[0]

  if (minIndexes[0] === maxIndexes[0]) {
    return Math.max(
      getMax(maxIndexes[0]) - getMin(minIndexes[1] ?? 0),
      getMax(maxIndexes[1] ?? 0) - getMin(minIndexes[0]),
    )
  }
  return getMax(max) - getMin(min)
}
