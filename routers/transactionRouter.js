const express = require('express')
const { transactionController } = require('../controller')

const router = express.Router()
    router.put('/acceptedbyadmin/:id',transactionController.statusAceptedByAdmin)
    router.post('/uploadimage/:id',transactionController.uploadImagePayment)

module.exports=router