const { default: mongoose } = require('mongoose');
const Appointment = require('../models/appointment.js');

class AppointmentController {
    // GET /:id
    index(req, res, next) {
        const userId = req.params.id;
        console.log(userId);
        Appointment.find({ "user": { _id:userId }} ).limit(10)
            .then(appointments => res.status(200).json(appointments))
            .catch(next);
    }

    // GET /search/
    search(req, res, next) {
        Appointment.find(req.params)
            .then(appointments => res.status(200).json(appointments))
            .catch(next);
    }

    // GET  /:id
    show(req, res, next) {
        Appointment.findById(req.params.id)
            .then(appointments => res.status(200).json(appointments))
            .catch(next);
    }

    // POST /:id
    post(req, res) {
        console.log(req.body)

        const appointment = new Appointment({
            userId :{
                _id: new mongoose.Types.ObjectId(req.params.id),
            },
            startTime: req.body.startTime,
            endTime: req.body.endTime,
        })
        try {
            const newAppointment = appointment.save();
            res.status(201).json(appointment);
        } catch (err) {
            res.status(400).json({
                message: err.message
            });
        }
    }

    // PUT /:id
    put (req, res, next) {
        Appointment.updateOne({ _id: req.params.id }, {
            "status": req.body.status,
            "startTime": req.body.startTime,
        })
            .then((appointment) => res.status(200).send(appointment))
            .catch(next);
    }
}

module.exports = new AppointmentController;