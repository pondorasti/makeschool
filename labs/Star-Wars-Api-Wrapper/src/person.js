"use strict";
exports.__esModule = true;
/*
 * A Star Wars universe species and its attributes.
 */
var Species = /** @class */ (function () {
    function Species(json) {
        this.name = json.name;
        this.classification = json.classification;
        this.homeworld = json.homeworld === 'n/a' ? null : json.homeworld;
        this.language = json.language === 'n/a' ? null : json.language;
    }
    return Species;
}());
exports.Species = Species;
/**
 * Represents a Star Wars Person (e.g. Luke Skywalker) and their attributes.
 */
var Person = /** @class */ (function () {
    function Person(json) {
        this.name = json.name;
        this.height = parseInt(json.height);
        this.mass = parseInt(json.mass);
        this.birthYear = json.birth_year;
        this.homeworld = json.homeworld;
    }
    Person.prototype.setFilms = function (films) {
        this.films = films;
    };
    Person.prototype.setSpecies = function (species) {
        this.species = species;
    };
    return Person;
}());
exports.Person = Person;
