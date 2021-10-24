import minimumHammingDistance from "."

describe('minimumHammingDistance', ()=>{
    test('case 1', ()=>{
        const source = [1,2,3,4]
        const target = [2,1,4,5]
        const allowed = [[0,1],[2,3]]
        expect(minimumHammingDistance(source, target, allowed)).toBe(1)
    })
})