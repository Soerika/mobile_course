require('dotenv').config();

User = require('../models/user');

const jwt = require('jsonwebtoken');
const accessTokenSecret = process.env.ACCESS_TOKEN_SECRET;

class userAuthController {
    login(req, res, next) {
        const email = req.body.username;
        const password = req.body.password;
        
        User.find({
            "email": email,
            "password": password
        }).then(() => {
            const user = {
                email: email,
                password: password,
            }
            const accessToken = jwt.sign(user, accessTokenSecret);
            res.status(200).json({ accessToken: accessToken });
        }).catch(next);
    }

    refresh(req, res, next) {
        res.status(200).json({
            "refresh": "refresh"
        })
    }
}

module.exports = new userAuthController;