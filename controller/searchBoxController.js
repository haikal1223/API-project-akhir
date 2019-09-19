const conn = require('../database')

module.exports={
    getSearched: (req,res) => {
        console.log('ini query search')
        console.log(req.query.search)
        var sql = `SELECT p.id, p.name,
        p.price, p.description,
        category.name AS category,
        brand.name AS brand,
        p.image,
        p.stock
        FROM products p
        JOIN category
        ON p.categoryid = category.id
        JOIN brand
        ON p.brandid = brand.id
        where p.isdeleted=0 and p.name LIKE '%${req.query.search}%' OR brand.name LIKE '%${req.query.search}%'`

        conn.query(sql,(err,result) => {
            if(err) return res.status(500).send(err)

            return res.status(200).send(result)
        })
    }
}