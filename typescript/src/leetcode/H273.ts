const Thousands = ['', 'Thousand', 'Million', 'Billion']
const Tens = [
  '',
  'Ten',
  'Twenty',
  'Thirty',
  'Forty',
  'Fifty',
  'Sixty',
  'Seventy',
  'Eighty',
  'Ninety',
]
const Elevens = [
  '',
  'Eleven',
  'Twelve',
  'Thirteen',
  'Fourteen',
  'Fifteen',
  'Sixteen',
  'Seventeen',
  'Eighteen',
  'Nineteen',
]
const Numbers = [
  '',
  'One',
  'Two',
  'Three',
  'Four',
  'Five',
  'Six',
  'Seven',
  'Eight',
  'Nine',
]

const getWord = (num: number) => {
  let words: string[] = []
  let temp = num
  const one = temp % 10
  temp = (temp - one) / 10
  const ten = temp % 10
  const hundred = (temp - ten) / 10

  if (hundred > 0) {
    words.push(`${Numbers[hundred]} Hundred`)
  }
  if (ten > 1) {
    words.push(Tens[ten])
    words.push(Numbers[one])
  } else if (ten === 1 && one === 0) {
    words.push(Tens[ten])
  } else if (ten === 1) {
    words.push(Elevens[one])
  } else if (one > 0) {
    words.push(Numbers[one])
  }
  return words.filter((w) => w).join(' ')
}

function numberToWords(num: number): string {
  if (num === 0) return 'Zero'
  let number = num
  let words: string[] = []
  while (number > 0) {
    const mod = number % 1000
    number = (number - mod) / 1000
    words.push(getWord(mod))
  }

  return words
    .map((word, i) => {
      return i === 0 || !word ? word : `${word} ${Thousands[i]}`
    })
    .filter((w) => w)
    .reverse()
    .join(' ')
}
