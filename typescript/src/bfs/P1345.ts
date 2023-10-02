function minJumps(arr: number[]): number {
  const visited: boolean[] = new Array(arr.length);
  const map : {
    [key: number]: number[] | undefined
  } = {};

  for (let i = 0; i < arr.length; i += 1) {
    if (!map[arr[i]]) {
      map[arr[i]] = [];
    }
    map[arr[i]]!.push(i);
  }

  const queue = [0];
  visited[0] = true;
  let depth = 0;
  while (queue.length > 0) {
    const size = queue.length;
    for (let i = 0; i < size; i += 1) {
      const idx = queue.shift();
      if (idx == null) {
        continue;
      }

      if (idx === arr.length - 1) {
        return depth
      }

      if (idx >= 1 && !visited[idx - 1]) {
        visited[idx - 1] = true;
        queue.push(idx - 1);
      }
      if (idx < arr.length - 1 && !visited[idx + 1]) {
        visited[idx + 1] = true;
        queue.push(idx + 1);
      }
      const sameValues = map[arr[idx]];
      sameValues?.forEach(index => {
        if (visited[index] || index === idx) {
          return;
        }
        visited[index] = true;
        queue.push(index);
      });
      map[arr[idx]] = undefined
    }
    depth += 1;
  }

  return depth;
}