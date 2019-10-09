const express = require('express')
const { productController } = require('../controller')

var router = express.Router()

router.get('/allproduct',productController.getAll)
router.get('/productdetail/:id', productController.getProductDetail)
router.get('/discountproduct',productController.getDiscountProduct)
router.get('/randomproduct',productController.getRandomProduct)
router.get('/brandcat/:brandid/:catid/:page',productController.getBrandCat)
router.post('/addproduct',productController.addProduct)
router.put('/deleteproduct/:id',productController.deleteProducts)
router.put('/editproduct/:id', productController.editProducts )
router.get('/recentproduct',productController.getRecentProduct)

module.exports = router