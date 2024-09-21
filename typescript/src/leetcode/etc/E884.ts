function uncommonFromSentences(s1: string, s2: string): string[] {
  const onceSet = new Set<string>()
  const twiceSet = new Set<string>()
  ;[s1, s2].forEach((s) => {
    s.split(' ').forEach((w) => {
      if (onceSet.has(w)) {
        onceSet.delete(w)
        twiceSet.add(w)
        return
      } else if (twiceSet.has(w)) {
        return
      }
      onceSet.add(w)
    })
  })

  return Array.from(onceSet)
}
