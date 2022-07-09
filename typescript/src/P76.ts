function minWindow(s: string, t: string): string {
  const map = {}
  function hasStr(t: string) {
    const tempMap = { ...map }
    for (const char of t) {
      if (!tempMap[char]) {
        return false
      }
      tempMap[char] -= 1
    }

    return true
  }

  function add(s: string) {
    if (!map[s]) {
      map[s] = 0
    }
    map[s] += 1
  }

  function remove(s: string) {
    map[s] -= 1
  }

  let res = ''

  let head = 0
  let tail = 0
  while (tail <= s.length) {
    if (hasStr(t)) {
      res =
        res.length === 0 || tail - head < res.length
          ? s.substring(head, tail + 1)
          : res
      if (tail - head === t.length) {
        break
      }
      remove(s.charAt(head))
      head += 1
    } else {
      tail += 1
      add(s.charAt(tail))
      if (res.length > 0) {
        remove(s.charAt(head))
        head += 1
      }
    }
  }

  return res
}
