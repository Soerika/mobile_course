require('dotenv').config();

const jwt = require('jsonwebtoken');

class userAuthController {
    login(res, req) {
        const username = req.body.username;

        
        jwt.sign()

    }

    refresh(res, req) {

    }
}

module.exports = new userAuthController;