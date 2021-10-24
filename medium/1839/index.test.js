import { findStartPoint, isBeautifulOrder, longestBeautifulSubstring, moveUntilNotDuplicatedChar } from "."

describe('longestBeautifulSubstring', ()=>{
    test('test 1', ()=>{
        const word = 'aeiaaioaaaaeiiiiouuuooaauuaeiu'
        const res = longestBeautifulSubstring(word)
        expect(res).toBe(13)
    })
})
describe('moveUntilNotDuplicatedChar', ()=>{
    const word = 'aeiaaioaaaaeiiiiouuuooaauuaeiu'
    test('test 1', ()=>{
        const res = moveUntilNotDuplicatedChar(word,0)
        expect(res).toBe(0)
    })
    test('test 2', ()=>{
        const res = moveUntilNotDuplicatedChar(word,3)
        expect(res).toBe(4)
    })
    test('test 3', ()=>{
        const res = moveUntilNotDuplicatedChar(word,8)
        expect(res).toBe(10)
    })
})
describe('findStartPoint', ()=>{
    test('test 1', ()=>{
        const word = 'aeiaaioaaaaeiiiiouuuooaauuaeiu'
        const res = findStartPoint(word,0)
        expect(res).toBe(0)
    })
    test('test 2', ()=>{
        const word = 'eiiiiouuuooaauuaeiu'
        const res = findStartPoint(word,0)
        expect(res).toBe(11)
    })
    test('test 2', ()=>{
        const word = 'u'
        const res = findStartPoint(word,0)
        expect(res).toBe(1)
    })
})
describe('isBeautifulOrder', ()=>{
    describe('a', ()=>{
        test('test 0', ()=>{
            const res = isBeautifulOrder('a','e')
            expect(res).toBe(true)
        })
        test('test 1', ()=>{
            const res = isBeautifulOrder('a','i')
            expect(res).toBe(false)
        })
        test('test 2', ()=>{
            const res = isBeautifulOrder('a','o')
            expect(res).toBe(false)
        })
        test('test 3', ()=>{
            const res = isBeautifulOrder('a','u')
            expect(res).toBe(false)
        })
    })
    describe('e', ()=>{
        test('test 0', ()=>{
            const res = isBeautifulOrder('e','a')
            expect(res).toBe(false)
        })
        test('test 1', ()=>{
            const res = isBeautifulOrder('e','i')
            expect(res).toBe(true)
        })
        test('test 2', ()=>{
            const res = isBeautifulOrder('e','o')
            expect(res).toBe(false)
        })
        test('test 3', ()=>{
            const res = isBeautifulOrder('e','u')
            expect(res).toBe(false)
        })
    })
    describe('i', ()=>{
        test('test 0', ()=>{
            const res = isBeautifulOrder('i','a')
            expect(res).toBe(false)
        })
        test('test 1', ()=>{
            const res = isBeautifulOrder('i','e')
            expect(res).toBe(false)
        })
        test('test 2', ()=>{
            const res = isBeautifulOrder('i','o')
            expect(res).toBe(true)
        })
        test('test 3', ()=>{
            const res = isBeautifulOrder('i','u')
            expect(res).toBe(false)
        })
    })
})