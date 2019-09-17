const express = require('express')
const { cartController} = require('../controller')
const router = express.Router()
const { auth } = require('../helpers/auth')


router.post('/addcart', cartController.AddCart)
router.get('/getcart',auth,cartController.getCart)
router.post('/addtransaction', cartController.addCheckOut)
router.get('/gettransaction/:username', cartController.getTransaction)
router.put('/deletecart', cartController.deleteCart)
router.get('/gettransactionadmin',cartController.getTransactionAdmin)
router.get('/gettransactiondetail/:id',cartController.getTransactionDetail)
module.exports = router