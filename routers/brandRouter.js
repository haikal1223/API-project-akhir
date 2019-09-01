const express = require('express')
const { brandController} = require('../controller')

const router = express.Router()

router.get('/getbrand',brandController.getBrand)
router.get('/getspecifiedbrand/:id',brandController.getCertainBrand)
router.post('/addbrand',brandController.addBrand)
router.put('/editbrand',brandController.editBrand)
router.delete('/deletebrand',brandController.deleteBrand)

module.exports =router