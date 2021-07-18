import { Person } from './person';
import { Planet } from './planet';
/**
 * Returns a Person object, including their species and the films they appear
 * in.
 *
 * @param personId The id of the person you're searching for.
 */
declare function getPerson(personId: number): Promise<Person>;
/**
 * Returns a Planet object, including the residents who live on that planet.
 *
 * @param personId The id of the person you're searching for.
 */
declare function getPlanet(planetId: number): Promise<Planet>;
export { getPerson, getPlanet };
