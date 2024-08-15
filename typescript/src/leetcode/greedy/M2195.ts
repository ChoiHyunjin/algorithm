function minimalKSum(nums: number[], k: number): number {
  const sorted = nums.sort((a, b) => a - b)
  let count = k
  let res = 0

  const getSum = (start: number, count: number) => {
    return ((start * 2 + count - 1) * count) / 2
  }

  for (let i = 0; i < sorted.length; i++) {
    const num = sorted[i]
    const prev = i === 0 ? 0 : sorted[i - 1]
    console.log(num, prev, count)
    if (num === prev) {
      continue
    } else if (num - prev - 1 >= count) {
      res += getSum(prev + 1, count)
      count = 0
      break
    } else {
      res += getSum(prev + 1, num - prev - 1)
      count -= num - prev - 1
    }
  }

  if (count > 0) {
    res += getSum((sorted.at(-1) ?? 0) + 1, count)
  }
  return res
}
