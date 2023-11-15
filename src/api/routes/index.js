const userRouter = require('./users');
const doctorRouter = require('./doctors');
const siteRouter = require('./site');
const appointmentRouter = require('./appointments');
const userAuthRouter = require('./userAuth');
const reviewRouter = require('./review');

function route(app) {
    app.use('/authentication', userAuthRouter);

    app.use('/users', userRouter);

    app.use('/doctors', doctorRouter);

    app.use('/appointments', appointmentRouter);

    app.use('/review', reviewRouter);

    app.use('/', siteRouter);
}

module.exports = route;