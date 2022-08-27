// BFS
function canReach(arr: number[], start: number): boolean {
  const bfs: number[] = [];
  const visited = {};
  let result = false;

  bfs.push(start);
  while (bfs.length > 0) {
    let idx = bfs.pop()!;
    if (!!visited[idx]) {
      continue;
    }
    visited[idx] = true;

    if (arr[idx] === 0) {
      return true;
    }

    if (idx - arr[idx] >= 0) {
      bfs.push(idx - arr[idx]);
    }
    if (idx + arr[idx] < arr.length) {
      bfs.push(idx + arr[idx]);
    }
  }

  return result;
}

// DFS
function canReach2(arr: number[], start: number): boolean {
  const visited = {};

  function dfs(idx: number): boolean {
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
      result = dfs(idx - arr[idx])
      visit[0] = true
    }
    if(!result && !visit[1]) {
      result = dfs(idx + arr[idx])
      visit[1] = true
    }

    return result
  }

  return dfs(start);
}