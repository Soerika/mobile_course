const Specialization = require('../models/specialization');

function getIconURL(path) {
    return 'http://localhost:3000' + path
}

class SpecializationController {
    // /
    index (req, res, next) {
        Specialization.find()
            .then(specializations => {
                specializations.forEach(element => {
                    element['icon'] = getIconURL(element['icon'])
                });
                res.status(200).json(specializations)
                })
            .catch(next);
    }

    // /:slug
    get (req, res, next) {
        Specialization.findOne({"description": req.params.slug})
        .then(specialization => {
            console.log(req.params.slug);
            console.log(specialization);
            specialization['icon'] = getIconURL(specialization['icon'])
            res.status(200).json(specialization)
        })
        .catch(next);
    }
}

module.exports = new SpecializationController;