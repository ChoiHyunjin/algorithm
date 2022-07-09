function minWindow(s: string, t: string): string {
  let res = ''

  let head = 0
  let tail = t.length
  while (tail <= s.length) {
    const str = s.substring(head, tail)
    const ok = hasStr(str, t)
    if (ok) {
      res = res.length === 0 || str.length < res.length ? str : res
      if (str.length === t.length) {
        break
      }
      head += 1
    } else {
      tail += 1
      if (res.length > 0) {
        head += 1
      }
    }
  }

  return res
}

function hasStr(s: string, t: string) {
  const map = {}
  for (const char of s) {
    if (!map[char]) {
      map[char] = 0
    }
    map[char] += 1
  }

  let res = true

  for (const char of t) {
    if (!map[char]) {
      res = false
      break
    }
    map[char] -= 1
  }

  return res
}
