const swaggerJsDoc = require('swagger-jsdoc');
const swaggerUI = require('swagger-ui-express');

function swaggerConfig(app) {
  const swaggerOptions = {
    swaggerDefinition: {
      info: {
        title: 'doctor appointment API',
        version: '1.0.0'
      },
    },
    apis: ['./src/api/routes/*.js', './src/index.js'],
  };

  const swaggerDocs = swaggerJsDoc(swaggerOptions);
  app.use('/api-docs', swaggerUI.serve, swaggerUI.setup(swaggerDocs));
}

module.exports = swaggerConfig;
