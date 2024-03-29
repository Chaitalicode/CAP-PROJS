const chai = require("chai");
const chaiHttp = require("chai-http");
const server = require("./server");

// Configure chai
chai.use(chaiHttp);
chai.should();

let app = null;

before((done) => {
	server.then((result) => {
		app = result;
		done();
	});
});

describe("Covids Entity Set Operation", () => {
	describe("GET /covid/Covids", () => {
		it("+ should return a list of Covids data", (done) => {
			chai.request(app)
				.get("/covid/Covids")
				.end((error, response) => {
					try {
						response.should.have.status(200);
						response.body.value.should.be.an("array");
						done();
					} catch (error) {
						done(error);
					}
				});
		});
	});
});