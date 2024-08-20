function stoneGameII(piles: number[]): number {
  let memos: { [key in string]: number } = {}
  const sums: number[] = new Array(piles.length + 1).fill(0)

  for (let i = 0; i < piles.length; i++) {
    sums[piles.length - 1 - i] =
      sums[piles.length - i] + piles[piles.length - 1 - i]
  }

  // get results
  const getMax = (M: number, idx: number) => {
    let max = 0
    const key = `${M},${idx}`
    if (memos[key]) {
      return memos[key]
    }

    if (idx > piles.length) {
      memos[key] = 0
      return 0
    }
    if (piles.length - idx <= M * 2) {
      memos[key] = sums[idx]
      return sums[idx]
    }

    for (let x = 1; x <= M * 2; x++) {
      max = Math.max(max, sums[idx] - getMax(Math.max(M, x), idx + x))
    }
    memos[key] = max
    return max
  }

  return getMax(1, 0)
}

function stoneGameII2(piles: number[]): number {
  let result: number[] = []
  const sum = piles.reduce((p, c) => p + c, 0)
  let count = 0

  // get results
  const getResult = (M: number, idx: number, A: number) => {
    if (idx >= piles.length) {
      result.push(A)
      return
    }
    count++
    if (piles.length - idx <= M * 2) {
      let res = A
      for (let i = idx; i < piles.length; i++) {
        res += piles[i]
      }
      result.push(res)
      return
    }

    let temp = A
    for (let i = 1; i <= M * 2; i++) {
      temp += piles[idx + i - 1]
      if (Math.max(M, i) * 2 >= piles.length - (idx + i)) {
        result.push(temp)
        break
      }
      for (let j = 1; j <= Math.max(M, i) * 2; j++) {
        getResult(Math.max(M, j), idx + i + j, temp)
      }
    }
  }
  getResult(1, 0, 0)
  console.log('count:', count)
  console.log('result:', result)

  // sort
  result = result.sort((a, b) => Math.abs(sum - a * 2) - Math.abs(sum - b * 2))

  return result[0]
}
