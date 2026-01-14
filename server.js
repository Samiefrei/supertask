const express = require('express');
const os = require('os');
const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

app.get('/health', (req, res) => {
  res.json({ status: 'UP', hostname: os.hostname() });
});

if (require.main === module) {
  app.listen(port, () => console.log('API running'));
}

module.exports = app;
