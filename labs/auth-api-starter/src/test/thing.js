const app = require("../index.js");
const mongoose = require('mongoose');
const chai = require('chai'); // eslint-disable-line import/newline-after-import
const chaiHttp = require("chai-http");

chai.config.includeStack = true;

chai.use(chaiHttp);

/**
 * root level hooks
 */
after((done) => {
  // required because https://github.com/Automattic/mongoose/issues/1251#issuecomment-65793092
  mongoose.models = {};
  mongoose.modelSchemas = {};
  mongoose.connection.close();
  done();
});

describe('## Thing APIs', () => {
  // TODO: Implement more tests.

  it('should load homepage', () => {
    chai.request(app)
      .get('/api/thing')
      .end((err, res) => {
        if (err) {
          return done(err);
        }
        res.status.should.be.equal(200);
        return done();
      })
  })
});
