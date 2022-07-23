function isInterleave(s1: string, s2: string, s3: string): boolean {
    const memo = {}

    function bfs(p1: number, p2: number, p3: number): boolean {
        let res = false
        if (p3 >= s3.length) {
            return true
        }
        let c1 = s1[p1]
        let c2 = s2[p2]
        let c3 = s3[p3]

        if (c3 === c1) {
            res = memo[`${p1 + 1} ${p2}`] ?? bfs(p1 + 1, p2, p3 + 1)
        }
        if (!res && c3 === c2) {
            res = memo[`${p1} ${p2 + 1}`] ?? bfs(p1, p2 + 1, p3 + 1)
        }

        memo[`${p1} ${p2}`] = res
        return res
    }

    return s3.length === s1.length + s2.length && bfs(0, 0, 0)
};