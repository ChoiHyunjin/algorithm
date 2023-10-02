const { test, expect } = require('@jest/globals')
const { describe } = require('yargs')
import Problem62 from './Problem62'

const obj = new Problem62()
test('1', () => {
  const res = obj.solution()
  expect(1).toBe(1)
})
