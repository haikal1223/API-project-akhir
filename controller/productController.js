const conn = require('../database')
const { uploader } = require('../helpers/uploader')
const fs = require('fs')

module.exports = {
    getAll: (req,res) => {
        if(!req.query.page){
            req.query.page=1
        }

        offset = req.query.page * 6 - 6

        var sql = `SELECT p.id, p.name,
        p.price, p.description,
        category.name AS category,
        brand.name AS brand,
        p.image,
        p.stock,
        p.discount
        FROM products p
        JOIN category
        ON p.categoryid = category.id
        JOIN brand
        ON p.brandid = brand.id
        where p.isdeleted=0 `

        conn.query(sql,(error,result)=>{
            if(error) return res.status(500).send(error)

            sql+= `limit ${offset}, 6`

        conn.query(sql,(error,result1) => {
            if(error) return res.status(500).send(error)

            res.status(200).send({
                dataProduct: result1,
                totalPages:result.length,
                pages: Number(req.query.page)
            })
            })
        })
    },

    getRecentProduct: (req,res) => {
        var sql = `SELECT p.id, p.name,
        p.price, p.description,
        category.name AS category,
        brand.name AS brand,
        p.image,
        p.stock,
        p.discount
        FROM products p
        JOIN category
        ON p.categoryid = category.id
        JOIN brand
        ON p.brandid = brand.id
        where p.isdeleted=0  ORDER BY p.id desc `
        conn.query(sql,(error,result)=>{
            if(error) return res.status(500).send(error)

            return res.status(200).send(result)
        })

    },
    getProductDetail: (req,res) => {
        var sql = `SELECT
                    p.id,
                    p.name,
                    p.price, 
                    p.description,
                    p.discount,
                    category.name AS category,
                    brand.name AS brand,
                    p.image AS image,
                    p.stock
                    FROM products p
                    JOIN category
                    ON p.categoryid = category.id
                    JOIN brand
                    ON p.brandid = brand.id
                    where p.id=${req.params.id} and p.isdeleted=0`

        conn.query(sql,(error,result) => {
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
                    sql = `SELECT * FROM products where isdeleted=0 `;
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
        var postId = req.params.id;
        var sql = `SELECT * FROM products WHERE id = ${postId}`
        conn.query(sql,(err,result)=>{
            if(err) throw err;

            if(result.length > 0) {
                const path = '/post/images'; //file save path
                const upload = uploader(path,'POS').fields([{name:'image'}]); //uploader(path,default prefix)

                upload(req,res,(err)=>{
                    if(err){
                        return res.status(500).json({message : 'Upload Picture Failed!', error:err.message})
                    }
                    const {image} = req.files // kalo file ga dikasih image jadi undefined
                    // console.log(image);
                    const imagePath = image ? path + '/' + image[0].filename : null;
                    const data = JSON.parse(req.body.data)
                    // console.log(data);
                    

                    try{
                        if(imagePath) {
                            data.image = imagePath;

                        }
                        sql = `UPDATE products SET ? WHERE id = ${postId}`
                        conn.query(sql,data,(err1,result1)=>{
                            if(err1) {
                                if(imagePath){
                                    fs.unlinkSync('./public' + imagePath);
                                }
                                return res.status(500).json({message : "There's an error on the server. Please contact the administrator.", error :err1.message})    
                            }
                            if(imagePath){
                                fs.unlinkSync('./public' + result[0].image )
                            }
                            sql = `SELECT p.id, p.name,
                            p.price, p.description,
                            category.name AS category,
                            brand.name AS brand,
                            p.image,
                            p.stock,
                            p.discount
                            FROM products p
                            JOIN category
                            ON p.categoryid = category.id
                            JOIN brand
                            ON p.brandid = brand.id
                            where p.isdeleted=0 `;
                            conn.query(sql,(err2,result2)=>{
                                if(err2){
                                    return res.status(500).json({message : "There's an error on the server. Please contact the administrator.",error : err1.message})
                                }
                                
                                return res.status(200).send(result2)
                            })
                        })
                    }
                    catch(err){
                        console.log(err.message);
                        return res.status(500).json({message : "There's an erro on the server. Please contact the administrator.",error : err1.message})
                        
                    }
                })
            }
        })
    },
    deleteProducts: (req,res) => {
        var sql = `UPDATE products SET isdeleted = 1 WHERE id = ${req.params.id}`
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