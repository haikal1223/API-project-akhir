const express = require('express')
const { categoryController } = require('../controller')


const router = express.Router()

router.get('/getcategory',categoryController.getCategory)
router.get('/getspesificcategories/:id',categoryController.getCertainCategory)
router.post('/postcategory',categoryController.addCategory)
router.put('/editcategory/:id',categoryController.editCategory)
router.delete('/deletecategory/:id',categoryController.deleteCategory)

module.exports = router