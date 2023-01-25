function maxJumps(arr: number[], d: number): number {
  let max = 0;

  const visited: { [key: number]: number } = {};
  function canJump(from: number, to: number): boolean{
    let res = true

    const left = from > to ? to : from
    const right = from > to ? from: to

    if(res){
      for(let i=left; res && i<= right ; i+=1){
        res = res && arr[from] > arr[i]
      }
    }

    return res
  }

  function jump(start: number): number{
    let res = 0;

    if(!!visited[start]){
      return visited[start]
    }

    const left = start - d < 0 ? 0 : start - d
    const right = start + d >= arr.length ? arr.length-1 : start + d
    for(let i = left; i <= right ; i+=1){
      if(!canJump(start, i)){
        continue
      }
      const val = jump(i)
      res = Math.max(val)
    }

    visited[start] = res + 1
    return res + 1
  }

  for (let i = 0; i < arr.length; i += 1) {
    const val = jump(i)
    max = Math.max(val, max)
  }

  return max;
};
