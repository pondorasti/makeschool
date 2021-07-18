/**
 * Interface for Film data retrieved from SWAPI.
 */
interface FilmJSON {
  title: string;
}

/*
 * Interface for Species data retrieved from SWAPI.
 */
interface SpeciesJSON {
  name: string;
  classification: string;
  homeworld: string | null;
  language: string;
}

/*
 * Interface for Person data retrieved from SWAPI.
 */
interface PersonJSON {
  name: string;
  height: string;
  mass: string;
  birth_year: string;
  homeworld: string;
  species: string[];
  films: string[];
}

/*
 * A Star Wars universe species and its attributes.
 */
class Species {
  name: string;
  classification: string;
  homeworld: string | null;
  language: string | null;

  constructor(json: SpeciesJSON) {
    this.name = json.name;
    this.classification = json.classification;
    this.homeworld = json.homeworld === 'n/a' ? null : json.homeworld;
    this.language = json.language === 'n/a' ? null : json.language;
  }
}

/**
 * Represents a Star Wars Person (e.g. Luke Skywalker) and their attributes.
 */
class Person {
  name: string;
  height: number;
  mass: number;
  birthYear: string;
  homeworld: string;
  films: string[];
  species: Species;

  constructor(json: PersonJSON) {
    this.name = json.name;
    this.height = parseInt(json.height);
    this.mass = parseInt(json.mass);
    this.birthYear = json.birth_year;
    this.homeworld = json.homeworld;
  }

  setFilms(films: string[]) {
    this.films = films;
  }

  setSpecies(species: Species) {
    this.species = species;
  }
}

export { FilmJSON, SpeciesJSON, PersonJSON, Species, Person };
