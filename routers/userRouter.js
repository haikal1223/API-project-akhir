const express = require('express')
const {usersController} = require('../controller')
const { auth } = require('../helpers/auth')
const router = express.Router()

router.post('/register',usersController.register)
router.put('/verifikasiemail',usersController.emailVerifikasi)
router.post('/resendemailver',usersController.resendEmailVer)
router.post('/login',usersController.login)
router.post('/keeplogin', auth, usersController.keepLogin)

module.exports = router