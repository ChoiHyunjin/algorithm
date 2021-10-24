import { combine, getPermutation, numTilePossibilities } from '.'

describe('combine', ()=>{
    test('test1', ()=>{
        const res = combine('a', 'b')
        expect(res[0]).toBe('ab')
        expect(res[1]).toBe('ba')
    })
    test('test2', ()=>{
        const res = combine('ab', 'b')
        expect(res[0]).toBe('abb')
        expect(res[1]).toBe('bab')
    })
})
describe('getPermutation', ()=>{
    const chars = 'AAB'.split('')
    test('test1', ()=>{
        const res = Array.from(getPermutation(chars, 1, 0))
        expect(res[0]).toBe('A')
        expect(res[1]).toBe('A')
        expect(res[2]).toBe('B')
    })
    test('test2', ()=>{
        const res = Array.from(getPermutation(chars, 2, 0))
        expect(res[0]).toBe('AA')
        expect(res[1]).toBe('AA')
        expect(res[2]).toBe('BA')
        expect(res[3]).toBe('AB')
    })
    test('test3', ()=>{
        const char = 'AAABBC'.split('')
        const res = Array.from(getPermutation(char, 2, 0))
        expect(res[0]).toBe('AA')
        expect(res[1]).toBe('AA')
        expect(res[2]).toBe('BA')
        expect(res[3]).toBe('AB')
    })
})
describe('numTilePossibilities', ()=>{
    test('test1', ()=>{
        const res = numTilePossibilities('AAABBC')
        expect(res).toBe(188)
    })
    test('test2', ()=>{
        const res = numTilePossibilities('a')
        expect(res).toBe(1)
    })
})

// export {numTilePossibilities, getPermutation, combine}