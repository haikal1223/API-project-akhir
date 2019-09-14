const express = require('express')
const { cartController} = require('../controller')
const router = express.Router()
const { auth } = require('../helpers/auth')


router.post('/addcart', cartController.AddCart)
router.post('/getcart',auth,cartController.getCart)
module.exports = router