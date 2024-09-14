function longestSubarray(nums: number[]): number {
  let count = 1

  let candidate = 0
  nums.reduce((p, c, i) => {
    if (nums[p] < c) {
      candidate = 1
      count = 1
      return i
    } else if (nums[p] === c) {
      candidate += 1
      return p
    }

    count = Math.max(candidate, count)
    candidate = 0
    return p
  }, 0)

  return Math.max(candidate, count)
}
