function shortestPalindrome(s: string): string {
  const map: { [key in string]: number[] } = {}
  const chars = s.split('')
  chars.forEach((c, i) => {
    if (!map[c]) {
      map[c] = []
    }
    map[c].unshift(i)
  })

  // find palindrome substring
  const startChar = chars[0]
  let palindromeIndex = 0
  map[startChar]?.forEach((idx) => {
    if (palindromeIndex > 0) {
      return
    }
    let isPalindrome = true
    let head = 0
    let tail = idx
    while (isPalindrome && head <= tail) {
      isPalindrome = s.at(head) === s.at(tail)
      head++
      tail--
    }

    if (isPalindrome) {
      palindromeIndex = idx
    }
  })

  return (
    chars
      .slice(palindromeIndex + 1)
      .reverse()
      .join('') + s
  )
}
