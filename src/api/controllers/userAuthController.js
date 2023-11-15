require('dotenv').config();
const accessTokenSecret = process.env.ACCESS_TOKEN_SECRET;

User = require('../models/user');

const jwt = require('jsonwebtoken');


class userAuthController {
    #refreshTokens = []

    login(req, res, next) {
        User.findOne({
            "email": req.body.email,
            "password": req.body.password,
        }).exec().then((user) => {
            if (!user) {
                res.status(400).json({ message: "user not found" });
                return next();
            }
            const userInfo = {
                email: req.body.email,
                password: req.body.password,
            }
            const accessToken = jwt.sign(userInfo, accessTokenSecret);
            res.status(200).json({ accessToken: accessToken });
        }).catch(next);
    }

    signup(req, res, next) {
        const data = req.body;

        // validation
        if(!data.email || !data.password || !data.firstName || !data.lastName) {
            res.status(400).json({
                message: "missing field",
            })
            return next();
        }

        User.findOne({
            "email": req.body.email,
        }).exec().then((user) => {
            if(!user) {
                const newUser = new User(req.body);
                newUser.save();

                const userInfo = {
                    email: req.body.email,
                    password: req.body.password,
                }
                
                const accessToken = jwt.sign(userInfo, accessTokenSecret);
                res.status(200).json({ accessToken: accessToken });
            } else {
                res.status(400).json({ message: "user exist" });
            }
        }).catch(next);
    }

    refresh(req, res, next) {
        res.status(200).json({
            refresh: "refresh"
        })
    }

    logout(req, res, next) {
        this.#refreshTokens = this.#refreshTokens.filter(token => token !== req.body.token)
        res.sendStatus(204)
    }
}

module.exports = new userAuthController;