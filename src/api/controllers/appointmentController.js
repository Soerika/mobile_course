const { default: mongoose } = require('mongoose');
const Appointment = require('../models/appointment.js');

class AppointmentController {
    // GET /:id
    indexUser(req, res, next) {
        const userId = req.params.id;
        Appointment.find({ userId: { _id:userId }} ).limit(10)
            .then(appointments => res.status(200).json(appointments))
            .catch(next);
    }

    // GET /:id
    indexDoctor(req, res, next) {
        const userId = req.params.id;
        Appointment.find({ doctorId: { _id:userId }} ).limit(10)
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

    // POST /
    post(req, res) {
        console.log(req.body)

        const newAppointment = new Appointment(req.body);
        try {
            newAppointment.save();
            return res.status(201).json(newAppointment);
        } catch (err) {
            res.status(400).json({
                message: err.message
            });
        }
    }

    // PUT /:id
    put (req, res, next) {
        Appointment.updateOne({ _id: req.params.id }, req.body)
            .then((appointment) => res.status(200).send(appointment))
            .catch(next);
    }
}

module.exports = new AppointmentController;