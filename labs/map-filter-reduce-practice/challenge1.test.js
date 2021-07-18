const {
  convertNumbersToPrices,
  transformBalancetoCurrency,
  filterOddNumbers,
  filterUnregisteredPeople,
  filterUnregisteredAndUnactivePeople,
  sumNumbers,
  totalAge,
  highestBalanceHolder,
  countInstancesofEyeColor,
  registeredWomen,
  totalBalanceRegandActiveMen,
  totalBalanceRegandActiveWomen,
  totalBalanceAge35_40,
} = require("./challenge1");



const numbers = [1, 2, 3, 4, 5];
const people = require("./people");

console.table(people);

describe.skip("Map Problems", () => {
  test("Test numbers to prices", () => {
    expect(convertNumbersToPrices(numbers)).toEqual([
      "$1.00",
      "$2.00",
      "$3.00",
      "$4.00",
      "$5.00",
    ]);
  });

  test("Test transform balance to currency ", () => {
    let indexZero = transformBalancetoCurrency(people)[0];
    let indexEleven = transformBalancetoCurrency(people)[11];
    expect(indexZero).toEqual("$2489.10");
    expect(indexEleven).toEqual("$1859.68");
  });
});

describe.skip("Filter Problems", () => {
  test("Test filter out odd numbers ", () => {
    expect(filterOddNumbers(numbers)).toEqual([2, 4]);
  });

  test("Test filter people by registeration", () => {
    expect(filterUnregisteredPeople(people).length).toEqual(10);
  });
  test("Test registered people who are active", () => {
  expect(filterUnregisteredAndUnactivePeople(people).length).toEqual(5);
	expect(filterUnregisteredAndUnactivePeople(people)).toContainEqual({
		"index": 14,
		"isActive": true,
		"balance": 2757.82,
		"age": 40,
		"eyeColor": "blue",
		"name": "Susana Goodwin",
		"gender": "woman",
		"address": "759 Otsego Street, Jeff, New Mexico, 6299",
		"registered": true
	  })
  });
});

describe.skip('Reduce Problems', () => {
	test('Test sum of array of numbers', () => {
		expect(sumNumbers(numbers)).toEqual(15)
	})
	test('Test the sum of the ages of every person in the people data set', () => {
		expect(totalAge(people)).toEqual(571);
	})

	test('Test the highest balance holder', () => {
		expect(highestBalanceHolder(people)).toContainEqual({
			name: "Dixie Harrell",
			balance: 3763.72
		})
	})
	
	test('Test the count for instances of eyeColor', () => {
		expect(countInstancesofEyeColor(people)).toContainEqual({
			blue: 8,
			brown: 4,
			green: 7
		})
	})

  test('Test the names of registered women', () => {
    let registeredWomenArray = registeredWomen(people);
    expect(registeredWomenArray).toContain('Andrea Barrera')
    expect(registeredWomenArray).toContain('Darla Leach')
    expect(registeredWomenArray).toContain('Susana Goodwin')
    expect(registeredWomenArray).toContain('Delia Shaw')
    expect(registeredWomenArray).toContain('Kerry Houston')

  })
	
})


describe.skip('Map/Reduce/Filter combo problems', () => {
    
  test('Test total sum of balance for men who are registered and active', () => {
    let totalBalMen = totalBalanceRegandActiveMen(people);
    expect(totalBalMen).toEqual('$1,842.33')
  });

  test('Test total sum of balance for women who are registered and active', () => {
    let totalBalWomen = totalBalanceRegandActiveWomen(people);
    expect(totalBalWomen).toEqual('$6,048.41')
  });
  
  test('Test total sum of balance for everyone between 35 and 40 years old', () => {
    let totalBalAge =totalBalanceAge35_40(people);
    expect(totalBalAge).toEqual('$10,516.29')
  });
})
