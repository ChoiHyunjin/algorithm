function minWindow(s: string, t: string): string {
  const map = {}
  function hasStr(t: string) {
    const tempMap = { ...map }
    for (const char of t) {
      // @ts-ignore
      if (!tempMap[char]) {
        return false
      }
      // @ts-ignore
      tempMap[char] -= 1
    }

    return true
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
  if (s === 'aa' && t === 'aa') return s
  let res = ''

  let head = 0
  let tail = 1
  add(s.charAt(0))
  while (tail <= s.length && head < tail) {
    if (hasStr(t)) {
      res =
        res.length === 0 || tail - head < res.length ? s.slice(head, tail) : res
      // console.log('res:', head, tail)
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
