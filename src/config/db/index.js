require('dotenv').config();

const mongoose = require('mongoose');
const serverURI = process.env.DATABASE_URI;
const localURL = process.env.DATABASE_URL_LOCAL;

// connect to local database
async function connectLocal() {
    try {
        mongoose.connect(localURL, {
            useNewUrlParser: true,
            useUnifiedTopology: true
        });
        console.log('Server started');
    } catch (err) {
        console.log(`Connect failed. Error: ${err}`);
    }
}

// server database
async function connectServer() {
    try {
        mongoose.connect(serverURI, {
            useNewUrlParser: true,
            useUnifiedTopology: true
        });
        console.log('cloud server started');
    } catch (err) {
        console.log(`Connect failed. Error: ${err}`);
    }
}

module.exports = { connectLocal, connectServer };