function maxResult(nums: number[], k: number): number {
  const dpArr: number[] = []

  dpArr[0] = nums[0]
  for (let i = 1; i < nums.length; i += 1) {
    let value = dpArr[i - 1]
    for (let j = i - 1; j >= Math.max(0, i - k); j -= 1) {
      value = Math.max(value, dpArr[j])
      if (nums[j] > 0) {
        break
      }
    }

    dpArr[i] = value + nums[i]
  }

  return dpArr[dpArr.length - 1]
}
