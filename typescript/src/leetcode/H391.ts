const getPoints = (rect: number[]): number[][] => [
  [rect[0], rect[1]],
  [rect[0], rect[3]],
  [rect[2], rect[1]],
  [rect[2], rect[3]],
]
const getSum = (rectangle: number[]) =>
  (rectangle[2] - rectangle[0]) * (rectangle[3] - rectangle[1])
const getHash = (p: number[]) => `${p[0]},${p[1]}`

function isRectangleCover(rectangles: number[][]): boolean {
  const range = [
    Number.MAX_VALUE,
    Number.MAX_VALUE,
    Number.MIN_VALUE,
    Number.MIN_VALUE,
  ]

  let sum = 0
  const set = new Set<string>()
  rectangles.forEach((rectangle) => {
    if (range[0] > rectangle[0]) range[0] = rectangle[0]
    if (range[1] > rectangle[1]) range[1] = rectangle[1]
    if (range[2] < rectangle[2]) range[2] = rectangle[2]
    if (range[3] < rectangle[3]) range[3] = rectangle[3]

    sum += getSum(rectangle)
    getPoints(rectangle).forEach((p) => {
      const hash = getHash(p)

      if (set.has(hash)) {
        set.delete(hash)
      } else {
        set.add(hash)
      }
    })
  })

  return (
    set.size === 4 &&
    getPoints(range).every((p) => set.has(getHash(p))) &&
    sum === getSum(range)
  )
}
