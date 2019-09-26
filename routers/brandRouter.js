const express = require('express')
const { brandController} = require('../controller')

const router = express.Router()

router.get('/getbrand',brandController.getBrand)
router.get('/getbrandhome',brandController.getBrandHome)
router.get('/getspecifiedbrand/:id',brandController.getCertainBrand)
router.post('/addbrand',brandController.addBrand)
router.put('/editbrand/:id',brandController.editBrand)
router.delete('/deletebrand/:id',brandController.deleteBrand)

module.exports =router