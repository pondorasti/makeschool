const lib = require('../src/index')

test('Golden Ratio', () => {
	expect(lib.goldenRatio(3)).toBe(3 * 1.61803398875)
})



