export default class Problem62 {
    uniquePaths(m: number, n: number): number {
        let map = [];
        
        for(let i=0; i < m; i += 1){
            map[i] = [1]
            for(let j=1; j < n; j+=1){
                map[i][j] = i === 0 ? 1 :map[i-1][j] + map[i][j-1]
            }
        }

        return map[m-1][n-1];
    }
}
