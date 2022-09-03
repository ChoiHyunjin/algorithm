function maxJumps(arr: number[], d: number): number {
  let max = 0

  const visited: { [key: number]: number } = {}
  function canJump(from: number, to: number): boolean {
    let res = true

    const left = from > to ? to : from + 1
    const right = from > to ? from - 1 : to
    for (let i = left; res && i <= right; i += 1) {
      res = arr[from] > arr[i]
    }

    return res
  }

  function jump(start: number): number {
    if (!!visited[start]) {
      return visited[start]
    }

    let res = 0

    const left = start - d < 0 ? 0 : start - d
    const right = start + d >= arr.length ? arr.length - 1 : start + d

    for (let i = left; i <= right; i += 1) {
      if (start === i || !canJump(start, i)) {
        continue
      }

      res = Math.max(res, jump(i))
    }

    visited[start] = res + 1
    return res + 1
  }

  for (let i = 0; i < arr.length; i += 1) {
    max = Math.max(max, jump(i))
  }

  return max
}
