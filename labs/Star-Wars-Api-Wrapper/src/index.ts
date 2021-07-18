import fetch from 'cross-fetch';

import { FilmJSON, SpeciesJSON, PersonJSON, Species, Person } from './person';
import { PlanetJSON, Planet } from './planet';


const BASE_URL = 'https://swapi.co/api';

/**
 * Returns a Person object, including their species and the films they appear
 * in.
 *
 * @param personId The id of the person you're searching for.
 */
async function getPerson(personId: number) {
  try {
    // Make person API call
    const personUrl = `${BASE_URL}/people/${personId}/`;
    console.log(personUrl);
    const personResponse = await fetch(personUrl);
    const personJson: PersonJSON = await personResponse.json();

    // Construct person
    const person: Person = new Person(personJson);

    // Add species
    const speciesUrl: string = personJson.species[0];
    const speciesResponse = await fetch(speciesUrl);
    const speciesJson: SpeciesJSON = await speciesResponse.json();

    person.setSpecies(new Species(speciesJson));

    // Add films
    const filmUrls: string[] = personJson.films;
    const filmJson = await Promise.all(filmUrls.map(async (url: string) => {
      const response = await fetch(url);
      return response.json();
    }));
    const filmTitles = filmJson.map((json: FilmJSON) => json.title);
    person.setFilms(filmTitles);

    return person;
  } catch (error) {
    // Handle error
    console.error(error);
    return null;
  }
}

/**
 * Returns a Planet object, including the residents who live on that planet.
 *
 * @param personId The id of the person you're searching for.
 */
async function getPlanet(planetId: number): Promise<Planet> {
  try {
    // Make planet API call
    const planetUrl = `${BASE_URL}/planets/${planetId}/`;
    const planetResponse = await fetch(planetUrl);
    const planetJson: PlanetJSON = await planetResponse.json();

    // Construct planet
    const planet: Planet = new Planet(planetJson);

    // Make people API calls
    const peopleUrls: string[] = planetJson.residents;
    const peopleJson = await Promise.all(peopleUrls.map(async (url: string) => {
      const response = await fetch(url);
      return response.json();
    }));

    // Construct people & add to planet
    const people = peopleJson.map((json: PersonJSON) => new Person(json));
    planet.setResidents(people);

    return planet;
  } catch (error) {
    // Handle error
    console.error(error);
    return null;
  }
}

export { getPerson, getPlanet };
