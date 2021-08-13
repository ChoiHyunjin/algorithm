import canVisitAllRooms, { getKeyOfNotOpenedRoom } from "."

describe('canVisitAllRooms', ()=>{
    test('test', ()=>{
        expect(canVisitAllRooms([[1],[2],[3],[]])).toBe(true)
    })
})

describe('getKeyOfNotOpenedRoom', ()=>{
    test('test', ()=>{
        expect(getKeyOfNotOpenedRoom([1,1,0,0],[0,1,1,0])).toBe(2)
    })
})