function nearestPalindromic(n: string): string {
  if (n.length === 1) {
    return (Number(n) - 1).toString()
  }

  const head = n.slice(0, Math.ceil(n.length / 2))
  const isEven = n.length % 2 === 0
  const reversed = head + getReversed(head, isEven)

  let candidateDown = (Number(head) - 1).toString()
  if (candidateDown === '0') {
    candidateDown = ''
  }
  let candidateDownisEven = isEven
  if (head.length !== candidateDown.length) {
    candidateDownisEven = !candidateDownisEven
    if (isEven) {
      candidateDown = candidateDown + '9'
    }
  }
  candidateDown =
    candidateDown + getReversed(candidateDown, candidateDownisEven)

  let candidateUp = (Number(head) + 1).toString()
  let candidateUpisEven = isEven
  if (head.length !== candidateUp.length) {
    candidateUpisEven = !candidateUpisEven
    if (!isEven) {
      candidateUp = candidateUp.slice(0, candidateUp.length - 1)
    }
  }
  candidateUp = candidateUp + getReversed(candidateUp, candidateUpisEven)

  const candidates = [reversed, candidateDown, candidateUp].filter(
    (a) => a !== n,
  )
  const diffs = candidates.map((a) => getDiff(a, n))
  let i = 0
  diffs.forEach((c, idx) => {
    if (c < diffs[i]) {
      i = idx
    } else if (diffs[i] === c) {
      i = BigInt(candidates[idx]) < BigInt(candidates[i]) ? idx : i
    }
  })
  return candidates[i]
}

const getReversed = (n: string, isEven: boolean) => {
  let reversed = ''
  const count = isEven ? n.length : n.length - 1
  for (let i = 0; i < count; i++) {
    reversed = n.at(i) + reversed
  }
  return reversed
}

const getDiff = (s1: string, s2: string) => {
  const i1 = BigInt(s1)
  const i2 = BigInt(s2)
  if (i1 > i2) {
    return i1 - i2
  } else {
    return i2 - i1
  }
}
