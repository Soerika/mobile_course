const express = require('express');
const morgan = require('morgan');
const db = require('./config/db/index');
const route = require('./api/routes/index.js');
const swaggerConfig = require('./config/swagger/swaggerConfig.js');

const app = express();
const port = 5000;

// log http request (dev mode)
app.use(morgan('combined'));

// connect to database
db.connect();

// middleware
app.use(express.json());
app.use(
    express.urlencoded({
        extended: true
    }),
);

// routes
swaggerConfig(app);
route(app);

app.listen(port, () => {
  console.log(`Example app listening on http://localhost:${port}`)
});

