const vowels: { [key in string]: number } = {
  a: 0,
  e: 1,
  i: 2,
  o: 3,
  u: 4,
}
function findTheLongestSubstring(s: string): number {
  const prefixes = Array<number[]>(s.length)
  s.split('').forEach((c, i) => {
    prefixes[i] = i > 0 ? [...prefixes[i - 1]] : Array(5).fill(0)
    const value = vowels[c]

    if (value !== undefined) {
      prefixes[i][value] += 1
    }
  })
  const indexes: { [key in string]: number[] } = { '': [-1] }
  const vowelKeys = Object.keys(vowels)
  prefixes.forEach((prefix, idx) => {
    const key = prefix.reduce((p, v, i) => {
      if (v % 2 > 0) {
        return p + vowelKeys[i]
      }
      return p
    }, '')
    if (!indexes[key]) {
      indexes[key] = [idx]
    } else {
      indexes[key][1] = idx
    }
  })

  return Object.values(indexes).reduce((p, c, i) => {
    let res = 0

    if (c.length > 1) {
      res = c[1] - c[0]
    }

    return Math.max(p, res)
  }, 0)
}
