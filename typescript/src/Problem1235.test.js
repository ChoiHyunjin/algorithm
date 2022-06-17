import Problem1235 from './Problem1235'

describe('', ()=>{
  test('test 1', () => {
    const obj = new Problem1235()
    expect(obj.sol([24,24,7,2,1,13,6,14,18,24],
      [27,27,20,7,14,22,20,24,19,27],
      [6,1,4,2,3,6,5,6,9,8])).toBe(20)
  })
})
