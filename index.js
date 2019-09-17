const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const bearerToken = require('express-bearer-token');

const port = 1999

const app = express()

app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended : false}))
app.use(express.static('public'))//munculin gambar kalo pake multer
app.use(bearerToken())

const { 
    categoryRouter, 
    brandRouter, 
    productRouter, 
    jumboSliderRouter, 
    searchBoxRouter, 
    usersRouter, 
    cartRouter ,
    transactionRouter
    } = require('./routers')
app.use('/category',categoryRouter)
app.use('/brand', brandRouter)
app.use('/product',productRouter)
app.use('/jumboslider', jumboSliderRouter)
app.use('/search',searchBoxRouter)
app.use('/user',usersRouter)
app.use('/cart',cartRouter)
app.use('/transaction',transactionRouter)

app.listen(port, ()=> console.log(` API JALAN DI PORT ${port} `))