import { Person } from './person';

/*
 * Interface for Planet data retrieved from SWAPI.
 */
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
class Planet {
  name: string;
  rotationPeriod: number;
  orbitalPeriod: number;
  diameter: number;
  climate: string;
  gravity: string;
  terrain: string;
  population: number;
  residents: Person[];

  constructor(json: PlanetJSON) {
    this.name = json.name;
    this.rotationPeriod = parseInt(json.rotation_period);
    this.orbitalPeriod = parseInt(json.orbital_period);
    this.diameter = parseInt(json.diameter);
    this.climate = json.climate;
    this.gravity = json.gravity;
    this.terrain = json.terrain;
    this.population = parseInt(json.population);
  }

  getName(): string {
    return `Welcome to the planet of ${this.name}`;
  }

  setResidents(residents: Person[]) {
    this.residents = residents;
  }
}

export { PlanetJSON, Planet };
