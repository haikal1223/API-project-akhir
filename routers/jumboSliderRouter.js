const express = require('express')
const { jumboSliderController } = require('../controller')

const router = express.Router()

router.get('/getallsliders', jumboSliderController.getSlider)
router.post('/addallsliders', jumboSliderController.addSlider)
router.delete('/deletesliders/:id',jumboSliderController.deleteSlider)

module.exports = router