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
var cross_fetch_1 = require("cross-fetch");
var person_1 = require("./person");
var planet_1 = require("./planet");
var BASE_URL = 'https://swapi.co/api';
/**
 * Returns a Person object, including their species and the films they appear
 * in.
 *
 * @param personId The id of the person you're searching for.
 */
function getPerson(personId) {
    return __awaiter(this, void 0, void 0, function () {
        var personUrl, personResponse, personJson, person, speciesUrl, speciesResponse, speciesJson, filmUrls, filmJson, filmTitles, error_1;
        var _this = this;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 6, , 7]);
                    personUrl = BASE_URL + "/people/" + personId + "/";
                    console.log(personUrl);
                    return [4 /*yield*/, cross_fetch_1["default"](personUrl)];
                case 1:
                    personResponse = _a.sent();
                    return [4 /*yield*/, personResponse.json()];
                case 2:
                    personJson = _a.sent();
                    person = new person_1.Person(personJson);
                    speciesUrl = personJson.species[0];
                    return [4 /*yield*/, cross_fetch_1["default"](speciesUrl)];
                case 3:
                    speciesResponse = _a.sent();
                    return [4 /*yield*/, speciesResponse.json()];
                case 4:
                    speciesJson = _a.sent();
                    person.setSpecies(new person_1.Species(speciesJson));
                    filmUrls = personJson.films;
                    return [4 /*yield*/, Promise.all(filmUrls.map(function (url) { return __awaiter(_this, void 0, void 0, function () {
                            var response;
                            return __generator(this, function (_a) {
                                switch (_a.label) {
                                    case 0: return [4 /*yield*/, cross_fetch_1["default"](url)];
                                    case 1:
                                        response = _a.sent();
                                        return [2 /*return*/, response.json()];
                                }
                            });
                        }); }))];
                case 5:
                    filmJson = _a.sent();
                    filmTitles = filmJson.map(function (json) { return json.title; });
                    person.setFilms(filmTitles);
                    return [2 /*return*/, person];
                case 6:
                    error_1 = _a.sent();
                    // Handle error
                    console.error(error_1);
                    return [2 /*return*/, null];
                case 7: return [2 /*return*/];
            }
        });
    });
}
exports.getPerson = getPerson;
/**
 * Returns a Planet object, including the residents who live on that planet.
 *
 * @param personId The id of the person you're searching for.
 */
function getPlanet(planetId) {
    return __awaiter(this, void 0, void 0, function () {
        var planetUrl, planetResponse, planetJson, planet, peopleUrls, peopleJson, people, error_2;
        var _this = this;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    _a.trys.push([0, 4, , 5]);
                    planetUrl = BASE_URL + "/planets/" + planetId + "/";
                    return [4 /*yield*/, cross_fetch_1["default"](planetUrl)];
                case 1:
                    planetResponse = _a.sent();
                    return [4 /*yield*/, planetResponse.json()];
                case 2:
                    planetJson = _a.sent();
                    planet = new planet_1.Planet(planetJson);
                    peopleUrls = planetJson.residents;
                    return [4 /*yield*/, Promise.all(peopleUrls.map(function (url) { return __awaiter(_this, void 0, void 0, function () {
                            var response;
                            return __generator(this, function (_a) {
                                switch (_a.label) {
                                    case 0: return [4 /*yield*/, cross_fetch_1["default"](url)];
                                    case 1:
                                        response = _a.sent();
                                        return [2 /*return*/, response.json()];
                                }
                            });
                        }); }))];
                case 3:
                    peopleJson = _a.sent();
                    people = peopleJson.map(function (json) { return new person_1.Person(json); });
                    planet.setResidents(people);
                    return [2 /*return*/, planet];
                case 4:
                    error_2 = _a.sent();
                    // Handle error
                    console.error(error_2);
                    return [2 /*return*/, null];
                case 5: return [2 /*return*/];
            }
        });
    });
}
exports.getPlanet = getPlanet;
