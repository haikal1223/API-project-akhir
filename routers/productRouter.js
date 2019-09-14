const express = require('express')
const { productController } = require('../controller')

var router = express.Router()

router.get('/allproduct',productController.getAll)
router.get('/productdetail/:id', productController.getProductDetail)
router.post('/addproduct',productController.addProduct)
router.delete('/deleteproduct/:id',productController.deleteProducts)
router.put('/editproduct/:id', productController.editProducts )

module.exports = router