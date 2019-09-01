const conn = require('../database')

module.exports={
    getSearched: (req,res) => {
        var sql = `SELECT p.id, p.name,
        p.price, p.description,
        category.name AS category,
        brand.name AS brand,
        img_p.image AS images,
        p.stock
        FROM products p
        JOIN category
        ON p.categoryid = category.id
        JOIN brand
        ON p.brandid = brand.id
        JOIN image_product img_p
        ON p.id = img_p.productid
        where isdeleted=1 and p.name LIKE '%${req.query.search}%'`

        conn.query(sql,(err,result) => {
            if(err) return res.status(500).send(err)

            return res.status(200).send(result)
        })
    }
}