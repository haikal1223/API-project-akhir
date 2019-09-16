const express = require('express')
const { cartController} = require('../controller')
const router = express.Router()
const { auth } = require('../helpers/auth')


router.post('/addcart', cartController.AddCart)
router.get('/getcart',auth,cartController.getCart)
router.post('/addtransaction', cartController.addCheckout)
router.get('/gettransaction/:username', cartController.getTransaction)
module.exports = router