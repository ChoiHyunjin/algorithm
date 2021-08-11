import longestPalindrome from '.'

test('medium5 a', () => {
  const input = 'a'
  expect(longestPalindrome(input)).toBe('a')
})
test('medium5 ac', () => {
  const input = 'ac'
  expect(longestPalindrome(input)).toBe('a')
})
test('medium5 abcdefedcba', () => {
  const input = 'abcdefedcba'
  expect(longestPalindrome(input)).toBe('abcdefedcba')
})
