const express = require('express')
const { jumboSliderController } = require('../controller')

const router = express.Router()

router.get('/getallsliders', jumboSliderController.getSlider)
router.put('/addallsliders', jumboSliderController.addSlider)

module.exports = router