
function firstCompleteIndex(arr: number[], mat: number[][]): number {
    const map: Record<number, [number, number]> = {}
    for (let i = 0; i < mat.length; i++) {
        for (let j = 0; j < mat[0].length; j++) {
            map[mat[i][j]] = [i, j]
        }
    }

    const rowlength = mat.length
    const columnlength = mat[0].length
    const columnCounts= Array(columnlength).fill(0)
    const rowCounts= Array(rowlength).fill(0)

    let result = 0
    while(result < arr.length) {
        const num = arr[result]

        const [row, column] = map[num]
        rowCounts[row] += 1
        columnCounts[column] += 1

        console.log(num, map[num], rowCounts, columnCounts)
        if(rowCounts[row]===columnlength || columnCounts[column]===rowlength) {
            break
        }
        result++
    }

    return result
};