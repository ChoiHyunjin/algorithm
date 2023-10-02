const { test, expect } = require('@jest/globals')
const { default: Problem1020 } = require('./Problem1020')

test('test 1', () => {
  const obj = new Problem1020()
  expect(obj.numEnclaves([[0,0,0,0],[1,0,1,0],[0,1,1,0],[0,0,0,0]])).toBe(3)
})
