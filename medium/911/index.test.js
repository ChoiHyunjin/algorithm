import TopVotedCandidate, { getIndexFromTimes } from "."

describe('getIndexFromTimes', ()=>{
    const times = [0, 5, 10, 15, 20, 25, 30]
    test('1', ()=>{
        expect(getIndexFromTimes(times, 24)).toBe(4)
    })
    test('2', ()=>{
        expect(getIndexFromTimes(times, 20)).toBe(4)
    })
    test('3', ()=>{
        expect(getIndexFromTimes(times, 0)).toBe(0)
    })
    test('4', ()=>{
        expect(getIndexFromTimes(times, 40)).toBe(0)
    })
    test('5', ()=>{
        expect(getIndexFromTimes(times, 5)).toBe(1)
    })
    test('6', ()=>{
        expect(getIndexFromTimes(times, 30)).toBe(6)
    })
})
describe('TopVotedCandidate', ()=>{
    describe('case 1', ()=>{
        const times = [0, 5, 10, 15, 20, 25, 30]
        const persons = [0, 1, 1, 0, 0, 1, 0]
        const top = new TopVotedCandidate(persons, times)
        test('1', ()=>{
            expect(top.q(3)).toBe(0)
        })
        test('2', ()=>{
            expect(top.q(12)).toBe(1)
        })
        test('3', ()=>{
            expect(top.q(25)).toBe(1)
        })
        test('4', ()=>{
            expect(top.q(15)).toBe(0)
        })
    })
    describe('case 2', ()=>{
        const times = [24,29,31,76,81]
        const persons = [0, 1, 0,1,1]
        const top = new TopVotedCandidate(persons, times)
        test('1', ()=>{
            expect(top.q(28)).toBe(0)
        })
        test('2', ()=>{
            expect(top.q(24)).toBe(0)
        })
        test('3', ()=>{
            expect(top.q(29)).toBe(1)
        })
        test('4', ()=>{
            expect(top.q(75)).toBe(0)
        })
    })
    describe('case 3', ()=>{
        const times = [0,6,39,52,75]
        const persons = [0, 0, 0,0,1]
        const top = new TopVotedCandidate(persons, times)
        test('1', ()=>{
            expect(top.q(99)).toBe(0)
        })
        test('2', ()=>{
            expect(top.q(49)).toBe(0)
        })
        test('3', ()=>{
            expect(top.q(59)).toBe(0)
        })
        test('4', ()=>{
            expect(top.q(68)).toBe(0)
        })
        test('4', ()=>{
            expect(top.q(42)).toBe(0)
        })
        test('4', ()=>{
            expect(top.q(37)).toBe(0)
        })
    })
})