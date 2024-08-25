function kthPalindrome(queries: number[], intLength: number): number[] {
  const isOdd = intLength % 2 === 1

  const getReversed = (a: string) => {
    let reversed = Array.from(a)
    if (isOdd) {
      reversed = reversed.slice(0, reversed.length - 1)
    }
    return reversed.reverse().join('')
  }

  const start = 10 ** (Math.ceil(intLength / 2) - 1)

  return queries
    .map((q) => {
      if (q > start * 9) {
        return '-1'
      }
      const str = String(start + q - 1)
      return str + getReversed(str)
    })
    .map(Number)
}
