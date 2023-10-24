const express = require('express');
const morgan = require('morgan');
const mongoose = require('mongoose');
const swaggerJsDoc = require('swagger-jsdoc');
const swaggerUI = require('swagger-ui-express');
const db = require('./config/db/index');
const route = require('./routes/index.js');

const app = express();
const port = 5000;

// log http request (dev mode)
// app.use(morgan('combined'));

// connect to database
// db.connect();

// middleware
// app.use(express.json());
// app.use(
//     express.urlencoded({
//         extended: true
//     }),
// );

const swaggerOptions = {
  swaggerDefinition: {
    info: {
      title: 'doctor appointment API',
      version: '1.0.0'
    },
  },
  apis: ['./src/routes/*.js', './src/index.js'],
};

const swaggerDocs = swaggerJsDoc(swaggerOptions);
app.use('/api-docs', swaggerUI.serve, swaggerUI.setup(swaggerDocs));
// routes
route(app);

app.listen(port, () => {
  console.log(`Example app listening on http://localhost:${port}`)
});

