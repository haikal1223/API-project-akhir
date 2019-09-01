const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')

const port = 1999

const app = express()

app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended : false}))

const { categoryRouter, brandRouter, productRouter, jumboSliderRouter, searchBoxRouter  } = require('./routers')
app.use('/category',categoryRouter)
app.use('/brand', brandRouter)
app.use('/product',productRouter)
app.use('/jumboslider', jumboSliderRouter)
app.use('/search',searchBoxRouter)

app.listen(port, ()=> console.log(` API JALAN DI PORT ${port} `))