const express = require('express')
const { searchBoxController } = require('../controller')

const router = express.Router()

router.get('/getsearched',searchBoxController.getSearched)

module.exports = router