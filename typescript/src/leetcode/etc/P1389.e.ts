function createTargetArray(nums: number[], index: number[]): number[] {
  const res = [nums[0]]
  for (let i = 1; i < nums.length; i += 1) {
    const idx = index[i]
    res.splice(idx, 0, nums[i])
  }
  return res
}
