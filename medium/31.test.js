import {swap} from './31.js'
describe('swap', ()=>{
    test('swap', ()=>{
        const arr = [1,2,3]
        swap(arr, 2, 3)

        expect(arr).toBe([1,2,3])
    })
})