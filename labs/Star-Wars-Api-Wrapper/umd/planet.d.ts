import { Person } from './person';
interface PlanetJSON {
    name: string;
    rotation_period: string;
    orbital_period: string;
    diameter: string;
    climate: string;
    gravity: string;
    terrain: string;
    population: string;
    residents: string[];
}
/**
 * A Star Wars universe Planet and its characteristics.
 */
declare class Planet {
    name: string;
    rotationPeriod: number;
    orbitalPeriod: number;
    diameter: number;
    climate: string;
    gravity: string;
    terrain: string;
    population: number;
    residents: Person[];
    constructor(json: PlanetJSON);
    getName(): string;
    setResidents(residents: Person[]): void;
}
export { PlanetJSON, Planet };
