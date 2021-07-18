"use strict";
exports.__esModule = true;
/**
 * A Star Wars universe Planet and its characteristics.
 */
var Planet = /** @class */ (function () {
    function Planet(json) {
        this.name = json.name;
        this.rotationPeriod = parseInt(json.rotation_period);
        this.orbitalPeriod = parseInt(json.orbital_period);
        this.diameter = parseInt(json.diameter);
        this.climate = json.climate;
        this.gravity = json.gravity;
        this.terrain = json.terrain;
        this.population = parseInt(json.population);
    }
    Planet.prototype.getName = function () {
        return "Welcome to the planet of " + this.name;
    };
    Planet.prototype.setResidents = function (residents) {
        this.residents = residents;
    };
    return Planet;
}());
exports.Planet = Planet;
