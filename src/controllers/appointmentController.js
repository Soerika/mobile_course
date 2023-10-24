const { default: mongoose } = require('mongoose');
const Appointment = require('../models/appointment.js');

class AppointmentController {
    // GET /
    index(req, res, next) {
        Appointment.find({})
            .then(appointments => res.json(appointments))
            .catch(next);
    }

    // GET /search
    search(req, res, next) {
        Appointment.find(req.query)
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
        const appointment = new Appointment({
            userId :{
                _id: mongoose.Types.ObjectId(req.params.id),
            },
            startTime: req.body.startTime,
            endTime: req.body.endTime,
        })
        try {
            const newAppointment = appointment.save();
            res.status(201).json(newAppointment);
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
        })
            .then((appointment) => res.status(200).send(appointment))
            .catch(next);
    }
}

module.exports = new AppointmentController;