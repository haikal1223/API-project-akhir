const conn = require('../database')
const { uploader } = require('../helpers/uploader')
const fs = require('fs')

module.exports = {
    getAll: (req,res) => {
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
        where isdeleted=1 `

        conn.query(sql,(error,result)=>{
            if(error) return res.status(500).send(error)

            return res.status(200).send(result)
        })
    },
    addProduct: (req,res) => {
        try {
            const path = '/post/images'; //file save path
            const upload = uploader(path, 'POS').fields([{ name: 'image'}]); //uploader(path, 'default prefix') image harus sesuai append di ui
    
            upload(req, res, (err) => {
                if(err){
                    return res.status(500).json({ message: 'Upload picture failed !', error: err.message });
                }
    
                const { image } = req.files;//image nya sama kaya di ui
                console.log(image)
                const imagePath = image ? path + '/' + image[0].filename : null;
                // console.log(imagePath)
    
                console.log(req.body.data)
                const data = JSON.parse(req.body.data);
                // console.log(data)
                data.image = imagePath;
                var sql = 'INSERT INTO products SET ?';
                conn.query(sql, data, (err, results) => {
                    if(err) {
                        console.log(err.message)
                        fs.unlinkSync('./public' + imagePath);
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                    }
                   
                    console.log(results);
                    sql = `SELECT * FROM products `;
                    conn.query(sql, (err, results) => {
                        if(err) {
                            console.log(err.message);
                            return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                        }
                        console.log(results);
                        
                        res.status(200).send(results);
                    })   
                })    
            })
        } catch(err) {
            return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
        }
    },
    editProducts: (req,res) => {
        var sql = `UPDATE products SET ? WHERE id = ${req.params.id}`
        conn.query(sql,req.body,(err,result) => {
            if (err) return res.status(500).send(err)

            sql = `SELECT * FROM products`
            conn.query(sql,(err,result1) =>{
                if (err) return res.status(500).send(err)

                res.status(200).send(result1)
            })
        })
    },
    deleteProducts: (req,res) => {
        var sql = `DELETE from products WHERE id = ${req.params.id}`
        conn.query(sql,(err,result) => {
            if (err) return res.status(500).send(err)

            sql = `SELECT * FROM products`
            conn.query(sql,(err,result1) =>{
                if (err) return res.status(500).send(err)

                res.status(200).send(result1)
            })
        })
    }
}