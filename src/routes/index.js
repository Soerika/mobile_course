const userRouter = require('./users.js');
const doctorRouter = require('./doctors.js');
const siteRouter = require('./site.js');
const appointmentRouter = require('./appointments.js');

function route(app) {
    app.use('/users', userRouter);

    app.use('/doctors', doctorRouter);

    app.use('/appointments', appointmentRouter);

    app.get('/', siteRouter);
}

module.exports = route;