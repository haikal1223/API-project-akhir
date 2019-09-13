const nodemailer = require('nodemailer')


const transporter = nodemailer.createTransport({
    service : 'gmail',
    auth: {
        user : 'muhammadhaikal507@gmail.com',
        pass : 'bgorphfijdzxswzy'
    },
    tls: {
        rejectUnauthorized : false
    }
})

module.exports = transporter