type PMap = { [key: string]: string }

function smallestEquivalentString(
  s1: string,
  s2: string,
  baseStr: string,
): string {
  const map: PMap = {}

  //   parker, morris, parser
  for (let i = 0; i < s1.length; i += 1) {
    const char = s1[i]
    const char2 = s2[i]
    const charArr = [char, char2] // [r, s]
    if (map[char]) {
      charArr.push(map[char])
    }
    if (map[char2]) {
      charArr.push(map[char2])
    }
    // charArr = [r, s, k]
    const sorted = charArr.sort()
    const value = sorted[0] // value= k
    map[char] = value
    map[char2] = value
    replaceValues(map, sorted)
  }

  let result = ''
  for (const char of baseStr) {
    const value = map[char]
    result += value ?? char
  }
  return result
}

function replaceValues(map: PMap, strArr: string[]) {
  const [toChar, ...rest] = strArr
  //   rest = [r, s], toChar = k
  // map = { r:'k', s:'k' }
  const keys = Object.keys(map)

  keys.forEach((key) => {
    // key = e, value = f
    if (!rest.includes(map[key])) {
      return
    }
    map[key] = toChar
  })
}
