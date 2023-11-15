require('dotenv').config();
const express = require('express');
const morgan = require('morgan');
const db = require('./config/db/index');
const route = require('./api/routes/index.js');
const swaggerConfig = require('./config/swagger/swaggerConfig.js');

const app = express();

// log http request (dev mode)
app.use(morgan('combined'));

// connect to database
db.connectServer();
// db.connectLocal();

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

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Example app listening on http://localhost:${port}`)
});

