import { CombinationIterator, getCombinations } from '.'

describe('getCombinations', ()=>{
    const chars = 'abc'.split('')
    test('test 1', ()=>{
        const combi = getCombinations(chars, 2, 0)
        expect(combi[0]).toBe('ab')
        expect(combi[1]).toBe('ac')
    })
})

describe('CombinationIterator', ()=>{
    describe('case 1', ()=>{
        const ci = new CombinationIterator('abc', 2)
        test('1', ()=>{
            const res = ci.next()
            expect(res).toBe('ab')
        })
        test('2', ()=>{
            const res = ci.next()
            expect(res).toBe('ac')
        })
        test('3', ()=>{
            const res = ci.next()
            expect(res).toBe('cb')
        })
    })
})