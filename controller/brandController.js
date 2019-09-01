const conn = require('../database')

module.exports = {
    getBrand: (req,res) => {
        var sql = 'SELECT * FROM brand'

        conn.query(sql,(err,result) => {
            if (err) res.status(500).send(err)

            return res.status(200).send(result)
        })
    },
    getCertainBrand: (req,res) => {
        var sql = `select p.* from products p JOIN brand ON p.brandid= brand.id where brand.id = ${req.params.id} and isdeleted = 1`

        conn.query(sql,(err,result) => {
            if (err) res.status(500).send(err)

            return res.status(200).send(result)
        })
    },
    addBrand: (req,res) => {
        var data = req.body
        var sql = 'INSERT INTO brand SET ?' 
        conn.query(sql,data,(err,result) => {
            if (err) res.status(500).send(err)

            sql=`SELECT * FROM brand`
            conn.query(sql,(err1,result1) => {
                if (err) res.status(500).send(err1)

                return res.status(200).send(result1)
            })
        })
    },
    editBrand: (req,res) => {
        var sql = `UPDATE brand SET ? WHERE id = ${req.params.id}`
        conn.query(sql,req.body,(err,result) => {
            if (err) res.status(500).send(err)

            sql = `SELECT * FROM brand`
            conn.query(sql,(err1,result1) => {
                if(err) res.status(500).send(err1)

                return res.status(200).send(result1)
            })
        })
    },
    deleteBrand: (req,res) => {
        var sql = `DELETE from brand Where id = ${req.params.id}`
        conn.query(sql,(err,result) => {
            if (err) res.status(500).send(err)

            sql=`SELECT * FROM brand`
            conn.query(sql,(err1,result1) => {
                if (err) res.status(500).send(err1)

                return res.status(200).semd(result1)
            })
        })
    }

}
