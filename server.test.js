const request = require('supertest');
const app = require('./server');

test('health up', async () => {
  const res = await request(app).get('/health');
  expect(res.statusCode).toBe(200);
});
