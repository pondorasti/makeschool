var chai = require('chai');
var chaiHttp = require('chai-http');
var server = require('../app');
var should = chai.should();

chai.use(chaiHttp);

var Pet = require('../models/pet');

var user = chai.request.agent(server);

describe("Pet", function() {

  // INDEX
  // it('should list ALL pets on '/' GET', function (done) {

  // });

  // SHOW
  // it('should list ALL pets on /pets GET', function (done) {

  // });

})