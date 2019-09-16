const mysql = require('mysql')

const conn = mysql.createConnection({
    host : 'localhost',
    user: 'Haikal',
    password:'dendi1223',
    database: 'ecommerce',
    port: 3306,
    multipleStatements:true
})

module.exports = conn