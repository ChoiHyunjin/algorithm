function minWindow(s: string, t: string): string {
  const map = {}
  const tMap = {}

  for (const char of t) {
    // @ts-ignore
    if (!tMap[char]) {
      // @ts-ignore
      tMap[char] = 0
    }
    // @ts-ignore
    tMap[char] += 1
  }

  function hasStr() {
    for (const char of t) {
      // @ts-ignore
      if (!hasChar(char)) {
        return false
      }
    }

    return true
  }

  function hasChar(char: string) {
    // @ts-ignore
    return map[char] >= tMap[char]
  }

  function add(s: string) {
    // @ts-ignore
    if (!map[s]) {
      // @ts-ignore
      map[s] = 0
    }
    // @ts-ignore
    map[s] += 1
  }

  function remove(s: string) {
    // @ts-ignore
    map[s] -= 1
  }

  let res = ''

  let head = 0
  let tail = 1
  add(s.charAt(0))
  while (tail <= s.length && head < tail) {
    if (hasStr()) {
      res =
        res.length === 0 || tail - head < res.length ? s.slice(head, tail) : res
      if (tail + 1 - head === t.length) {
        break
      }
      remove(s.charAt(head))
      head += 1
    } else {
      tail += 1
      add(s.charAt(tail - 1))
      if (res.length > 0) {
        remove(s.charAt(head))
        head += 1
      }
    }
  }

  return res
}
