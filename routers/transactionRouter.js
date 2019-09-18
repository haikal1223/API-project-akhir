const express = require('express')
const { transactionController } = require('../controller')

const router = express.Router()
    router.put('/acceptedbyadmin/:id',transactionController.statusAceptedByAdmin)
    router.post('/uploadimage/:id',transactionController.uploadImagePayment)
    router.put('/packagedelivered/:id',transactionController.statusPackageDelivered)
    router.put('/packagereceived/:id',transactionController.statusPackageReceived)
    router.put('/rejectedbyadmin/:id',transactionController.statusRejectedByAdmin)

module.exports=router