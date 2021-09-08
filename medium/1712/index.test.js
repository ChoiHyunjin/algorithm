import { waysToSplit } from '.'

describe('waysToSplit', ()=>{
    test('case1', ()=>{
        const res = waysToSplit([1,1,1])
        expect(res).toBe(1)
    })
    test('case2', ()=>{
        const res = waysToSplit([1,2,2,2,5,0])
        expect(res).toBe(3)
    })
    test('case3', ()=>{
        const res = waysToSplit([3,2,1])
        expect(res).toBe(0)
    })
    test('case4', ()=>{
        const input = new Array(100000).fill(0)
        const res = waysToSplit(input)
        expect(res).toBe(0)
    })
})