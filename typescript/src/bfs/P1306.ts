function canReach(arr: number[], start: number): boolean {
  const visited = {};

  function bfs(idx: number): boolean {
    if(idx < 0 || idx >= arr.length){
      return false
    }
    if(arr[idx] === 0){
      return true
    }

    let result = false;

    if(!visited[idx]){
      visited[idx] = [false, false]
    }

    const visit = visited[idx]

    if(!visit[0]) {
      result = bfs(idx - arr[idx])
      visit[0] = true
    }
    if(!result && !visit[1]) {
      result = bfs(idx + arr[idx])
      visit[1] = true
    }

    return result
  }

  return bfs(start);
}