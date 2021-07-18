"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
exports.__esModule = true;
var node_fetch_1 = require("node-fetch");
/*
 * Classes
 */
var Person = /** @class */ (function () {
    function Person(_a) {
        var name = _a.name;
        this.name = name;
    }
    return Person;
}());
exports.Person = Person;
var Planet = /** @class */ (function () {
    function Planet(_a) {
        var name = _a.name, rotation_period = _a.rotation_period, orbital_period = _a.orbital_period, diameter = _a.diameter, climate = _a.climate, gravity = _a.gravity, terrain = _a.terrain, population = _a.population;
        this.name = name;
        this.rotationPeriod = parseInt(rotation_period);
        this.orbitalPeriod = parseInt(orbital_period);
        this.diameter = parseInt(diameter);
        this.climate = climate;
        this.gravity = gravity;
        this.terrain = terrain;
        this.population = parseInt(population);
    }
    Planet.prototype.getName = function () {
        return "my name is " + this.name;
    };
    Planet.prototype.setResidents = function (residents) {
        this.residents = residents;
    };
    return Planet;
}());
exports.Planet = Planet;
/*
 * Async functions
 */
var BASE_URL = 'https://swapi.co/api';
function getPerson(personId) {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            return [2 /*return*/];
        });
    });
}
exports.getPerson = getPerson;
function getPlanet(planetId) {
    return __awaiter(this, void 0, void 0, function () {
        var url, response, json, planet, peopleUrls, peopleJson, people, error_1;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 4, , 5]);
                    url = BASE_URL + "/planets/" + planetId + "/";
                    return [4 /*yield*/, node_fetch_1["default"](url)];
                case 1:
                    response = _a.sent();
                    return [4 /*yield*/, response.json()];
                case 2:
                    json = _a.sent();
                    planet = new Planet(json);
                    peopleUrls = json.residents;
                    return [4 /*yield*/, Promise.all(peopleUrls.map(function (url) {
                            return node_fetch_1["default"](url).then(function (response) { return response.json(); });
                        }))];
                case 3:
                    peopleJson = _a.sent();
                    people = peopleJson.map(function (json) {
                        return new Person(json);
                    });
                    planet.setResidents(people);
                    return [2 /*return*/, planet];
                case 4:
                    error_1 = _a.sent();
                    console.log(error_1);
                    return [2 /*return*/, null];
                case 5: return [2 /*return*/];
            }
        });
    });
}
exports.getPlanet = getPlanet;
getPlanet(1).then(function (result) { return console.log(result); });
