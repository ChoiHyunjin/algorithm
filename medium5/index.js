/**
 * @param {string} s
 * @return {string}
 */
var longestPalindrome = function (s) {
  let res = s[0]

  for (let i = s.length - 1; i >= 0; i -= 1) {
    const index = s.indexOf(s[i])
    if (index > 0 && index <= i) {
      let temp = s.slice(index, i + 1)

      for (let j = index + 1; j > 0 && j < i; j += 1) {
        if (s[j] !== s[i - j]) {
          j = s.indexOf(s[i])
          temp = s.slice(j, i + 1)
        } else {
          if (j + 1 === i - j || j + 2 === i - j) {
            res = res.lenght <= temp.length ? temp : res
          }
        }
      }
    }
  }
  //   abcdefedcba
  //  abcdedcbe
  // abababcdedcbabbc
  return res
}

export default longestPalindrome
