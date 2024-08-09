function spiralMatrixIII(
  rows: number,
  cols: number,
  rStart: number,
  cStart: number,
): number[][] {
  const directions = [[0,1], [1,0], [0,-1], [-1,0]]
  const res: number[][] = []

  const isInRange = (r: number, c: number) => {
    return r >= 0 && r < rows && c >= 0 && c < cols
  }

  let ptr = [rStart, cStart]
  if (isInRange(rStart, cStart)) {
    res.push([...ptr])
  }

  let diff = Math.max(rStart, cStart, rows - rStart - 1, cols - cStart - 1)
  let flag = 0
  let val = 0
  for (let i = 1; i < diff; i += 1) {
    directions.forEach(dir => {
      flag += 1
      if(flag > 1){
        flag = 0
        val += 1
      }

      for(let k = 0; k< i+val; k += 1){
        ptr[0] += dir[0]
        ptr[1] += dir[1]
        console.log('ptr:', ptr);
        
        if (isInRange(ptr[0], ptr[1])) {
          res.push([...ptr])
        }
      }
    })
  }

  return res
}
