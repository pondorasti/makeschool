const musicalInstruments = require("./instruments");

const {
  woodWindInstruments,
  firstInstrumentLessThan10,
  sumOfIndexes,
  addMoreInstruments,
  instrumentWithHighestPlayers,
  totalNumberOfPlayers,
} = require("./challenge2");

describe("Slice method Problems", () => {
  test("Test Woodwind Instruments", () => {
    const clarinet = {
      family: "Woodwind",
      name: "Clarinet",
      players: 9,
    };

    const harmonica = {
      family: "Woodwind",
      name: "Harmonica",
      players: 7,
    };

    expect(woodWindInstruments(musicalInstruments)).toContainEqual(clarinet);
    expect(woodWindInstruments(musicalInstruments)).toContainEqual(harmonica);
    expect(woodWindInstruments(musicalInstruments)).toHaveLength(7);
  });
});

describe("Find method problems", () => {
  test("Test the first instrument with less than 10 players", () => {
    expect(firstInstrumentLessThan10(musicalInstruments)).toEqual({
      family: "Woodwind",
      name: "Clarinet",
      players: 9,
    });
  });
});

describe('indexOf and findIndexOf problems', () => {
    test('Test the sum of the indexes of piano, accordion, harp, double bass and lyre', () => {
        expect(sumOfIndexes(musicalInstruments)).toEqual(52)
    });
    
});

describe('Push and Unshift Problems', () => {
    test('Test add more instruments to the array', () => {

        let extendedList = addMoreInstruments(musicalInstruments)
        expect(extendedList[0]).toEqual({
            "family": "Brass", "name": "Vuvuzela", "players": 15
        })
        expect(extendedList[(extendedList.length) - 1]).toEqual({
            "family": "Woodwind", "name": "Bagpipe", "players": 12
        })
    });
    
});

describe('ForEach Problems', () => {
    test('Test the total number of players', () => {
        expect(totalNumberOfPlayers(musicalInstruments)).toEqual(176)
    });

    test('Test the instrument with the highest number of players', () => {
        expect(instrumentWithHighestPlayers(musicalInstruments)).toEqual({
            "family": "Brass",
            "name": "Tuba",
            "players": 18
        })
    });
    
    
});


