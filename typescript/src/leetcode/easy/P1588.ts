function sumOddLengthSubarrays(arr: number[]): number {
  let res = 0
  let value = Math.ceil(arr.length / 2)

  for (let i = 0; i < arr.length; i += 1) {
    const tail = arr.length - 1 - i
    if (i > tail) {
      break
    }
    res += value * (tail === i ? arr[i] : arr[i] + arr[arr.length - 1 - i])
    value += 1
  }

  return res
}
