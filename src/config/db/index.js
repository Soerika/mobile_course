require('dotenv').config();
const mongoose = require('mongoose');

// connect to database
async function connect() {
    try {
        mongoose.connect(process.env.DATABASE_URL, {
            useNewUrlParser: true,
            useUnifiedTopology: true
        });
        console.log('Server started');
    } catch (err) {
        console.log(`Connect failed. Error: ${err}`);
    }
}

module.exports = { connect };