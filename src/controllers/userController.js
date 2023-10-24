const User = require('../models/user.js');

class UserController {
    // GET /
    index(req, res, next) {
        User.find({})
            .then(users => res.json(users))
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

    // POST /login
    login(req, res, next) {
        res.send('login');
    }

    // POST /sign-up
    signUp(req, res) {
        const user = new User({
            firstName: req.body.firstName,
            lastName: req.body.lastName,
            email: req.body.email,
            password: req.body.password,
        })
        try {
            const newUser = user.save();
            res.status(201).json(newUser);
        } catch (err) {
            res.status(400).json({
                message: err.message
            });
        }
    }
}

module.exports = new UserController;