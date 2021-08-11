import { fourSum } from "./medium18.js"

test('fourSum', ()=>{
    const res = fourSum([1,0,-1,0,-2,2], 0)
    expect(res).toBe([-2,-1,1,2],[-2,0,0,2],[-1,0,0,1])
})