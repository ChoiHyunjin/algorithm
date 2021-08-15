import { findItinerary } from '.'

describe('getCombinations', ()=>{
    const chars = 'abc'.split('')
    test('test 1', ()=>{
        const combi = getCombinations(chars, 2, 0)
        expect(combi[0]).toBe('ab')
        expect(combi[1]).toBe('ac')
    })
})

describe('findItinerary', ()=>{
    describe('case 1', ()=>{
        const tickets = [['MUC','LHR'],['JFK','MUC'],['SFO','SJC'],['LHR','SFO']]
        const res = findItinerary(tickets)
        test('1', ()=>{
            expect(res[0]).toBe('JFK')
        })
        test('2', ()=>{
            expect(res[1]).toBe('MUC')
        })
        test('3', ()=>{
            expect(res[2]).toBe('LHR')
        })
        test('4', ()=>{
            expect(res[3]).toBe('SFO')
        })
        test('5', ()=>{
            expect(res[4]).toBe('SJC')
        })
    })
    describe('case 2', ()=>{
        const tickets = [['JFK','SFO'],['JFK','ATL'],['SFO','ATL'],['ATL','JFK'],['ATL','SFO']]
        const res = findItinerary(tickets)
        test('1', ()=>{
            expect(res[0]).toBe('JFK')
        })
        test('2', ()=>{
            expect(res[1]).toBe('ATL')
        })
        test('3', ()=>{
            expect(res[2]).toBe('JFK')
        })
        test('4', ()=>{
            expect(res[3]).toBe('SFO')
        })
        test('5', ()=>{
            expect(res[4]).toBe('ATL')
        })
    })
    describe('case 3', ()=>{
        const tickets = [['JFK','ATL'],['ATL','JFK']]
        const res = findItinerary(tickets)
        test('1', ()=>{
            expect(res[0]).toBe('JFK')
        })
        test('2', ()=>{
            expect(res[1]).toBe('ATL')
        })
        test('3', ()=>{
            expect(res[2]).toBe('JFK')
        })
    })
    describe('case 4', ()=>{
        const tickets = [['JFK','KUL'],['JFK','NRT'],['NRT','JFK']]
        const res = findItinerary(tickets)
        test('1', ()=>{
            expect(res[0]).toBe('JFK')
        })
        test('2', ()=>{
            expect(res[1]).toBe('NRT')
        })
        test('3', ()=>{
            expect(res[2]).toBe('JFK')
        })
        test('4', ()=>{
            expect(res[3]).toBe('KUL')
        })
    })
    // describe('case 5', ()=>{
    //     const tickets = [['EZE','TIA'],['EZE','HBA'],['AXA','TIA'],['JFK','AXA'],['ANU','JFK'],['ADL','ANU'],['TIA','AUA'],['ANU','AUA'],['ADL','EZE'],['ADL','EZE'],['EZE','ADL'],['AXA','EZE'],['AUA','AXA'],['JFK','AXA'],['AXA','AUA'],['AUA','ADL'],['ANU','EZE'],['TIA','ADL'],['EZE','ANU'],['AUA','ANU']]
    //     const res = findItinerary(tickets)
    //     test('1', ()=>{
    //         expect(res[0]).toBe('JFK')
    //     })
    //     test('2', ()=>{
    //         expect(res[1]).toBe('NRT')
    //     })
    //     test('3', ()=>{
    //         expect(res[2]).toBe('JFK')
    //     })
    //     test('4', ()=>{
    //         expect(res[3]).toBe('KUL')
    //     })
    // })
})