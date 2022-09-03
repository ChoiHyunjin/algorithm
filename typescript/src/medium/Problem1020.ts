export default class Problem1020 {
  numEnclaves(grid: number[][]): number {
    let res = 0
    const map = [...grid]

    const directions = [
      [-1, 0],
      [0, 1],
      [1, 0],
      [0, -1],
    ]

    function dfs(x: number, y: number): {value: number, available: boolean}{
      let res = 0
      let available = true
      if(x < 0 || x >= grid[0].length ||
        y < 0 || y >= grid.length ){
        res = 0
      }else if(map[y][x] <= 0){
        res = 0
      }else{
        if(x === 0 || y === 0 || 
        x === grid[0].length-1 || y === grid.length-1 ){
          available = false
        }
        map[y][x] = 0
        res += 1
        for (let direction of directions){
          const temp = dfs(x+direction[0], y+direction[1])
          res += temp.value
          available = available && temp.available
        }
      }
      return {value: res, available}
    }

    for(let i=0 ; i<grid.length ; i+=1){
      for(let j=0 ; j<grid[0].length ; j+=1){
        if(map[i][j] > 0){
          const temp = dfs(j, i)
          res += temp.available ? temp.value : 0
        }
      }
    }

    return res
  }
}
