function maxResult(nums: number[], k: number): number {
  const dpArr: number[] = []

  dpArr[0] = nums[0]
  let maxIndex = -1
  for (let i = 1; i < nums.length; i += 1) {
    let value = Number.MIN_VALUE
    if (maxIndex < 0 || maxIndex < i - k) {
      for (let j = i - 1; j >= Math.max(0, i - k); j -= 1) {
        if (dpArr[j] >= value) {
          maxIndex = j
          value = dpArr[j]
        }
      }
      console.log('maxIndex:', i, maxIndex)
    } else {
      value = dpArr[maxIndex]
    }

    if (nums[i] > 0) {
      maxIndex = i
    }

    dpArr[i] = value + nums[i]
  }
  console.log(dpArr)

  return dpArr[dpArr.length - 1]
}
