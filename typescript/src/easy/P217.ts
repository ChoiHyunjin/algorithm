function containsDuplicate(nums: number[]): boolean {
  const set = new Set()
  return nums.some((num) => {
    if (set.has(num)) {
      return true
    }
    set.add(num)
    return false
  })
}
