/**
 * Interface for Film data retrieved from SWAPI.
 */
interface FilmJSON {
    title: string;
}
interface SpeciesJSON {
    name: string;
    classification: string;
    homeworld: string | null;
    language: string;
}
interface PersonJSON {
    name: string;
    height: string;
    mass: string;
    birth_year: string;
    homeworld: string;
    species: string[];
    films: string[];
}
declare class Species {
    name: string;
    classification: string;
    homeworld: string | null;
    language: string | null;
    constructor(json: SpeciesJSON);
}
/**
 * Represents a Star Wars Person (e.g. Luke Skywalker) and their attributes.
 */
declare class Person {
    name: string;
    height: number;
    mass: number;
    birthYear: string;
    homeworld: string;
    films: string[];
    species: Species;
    constructor(json: PersonJSON);
    setFilms(films: string[]): void;
    setSpecies(species: Species): void;
}
export { FilmJSON, SpeciesJSON, PersonJSON, Species, Person };
