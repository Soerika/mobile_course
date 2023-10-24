const Doctor = require('../models/doctor');

class DoctorController {
    // GET /
    index(req, res) {
        Doctor.find({})
            .then(doctors => res.json(doctors))
            .catch(next);
    }

    // GET /search
    search(req, res, next) {
        Doctor.find(req.query)
            .then(doctors => res.status(200).json(doctors))
            .catch(next);
    }

    // GET  /:id
    show(req, res, next) {
        Doctor.findById(req.params.id)
            .then(doctor => res.status(200).json(doctor))
            .catch(next);
    }

}

module.exports = new DoctorController;