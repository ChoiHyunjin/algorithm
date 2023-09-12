// n^2
function countVowels2(word: string): number {
  const vowels = new Set(['a', 'e', 'i', 'o', 'u'])

  let res = 0
  const values = new Array(word.length + 1)

  for (let j = 0; j < word.length; j += 1) {
    values[j] = 0
    for (let i = j; i < word.length; i += 1) {
      values[i + 1] = values[i] + (vowels.has(word[i]) ? 1 : 0)
      res += values[i + 1]
    }
  }

  return res
}

function countVowels3(word: string): number {
  const vowels = new Set(['a', 'e', 'i', 'o', 'u'])

  const values = new Array(word.length + 1)
  values[0] = 0
  for (let i = 0; i < word.length; i += 1) {
    values[i + 1] =
      values[i] * 2 +
      (vowels.has(word[i]) ? 1 : 0) * (i + 1) -
      (i > 1 ? values[i - 1] : 0)
  }

  return values[values.length - 1]
}

function isVowel(letter: string) {
  return (
    letter === 'a' ||
    letter === 'e' ||
    letter === 'i' ||
    letter === 'o' ||
    letter === 'u'
  )
}

function countVowels(word: string): number {
  let res = 0
  for (let i = 0; i < word.length; i += 1) {
    if (!isVowel(word[i])) {
      continue
    }
    res += (word.length - i) * (i + 1)
  }

  return res
}
