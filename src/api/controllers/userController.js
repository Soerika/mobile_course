const User = require('../models/user.js');

class UserController {
    // GET /
    index(req, res, next) {
        User.find({})
            .then(users => res.status.json(users))
            .catch(next);
    }

    // GET /search
    search(req, res, next) {
        User.find(req.query)
            .then(users => res.status(200).json(users))
            .catch(next);
    }

    // GET /:id
    show(req, res, next) {
        User.findById(req.params.id)
            .then(user => res.status(200).json(user))
            .catch(next);
    }
}

module.exports = new UserController;