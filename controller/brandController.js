const conn = require('../database')
const { uploader } = require('../helpers/uploader')
const fs = require('fs')

module.exports = {
    getBrand: (req,res) => {
        var sql = 'SELECT * FROM brand'

        conn.query(sql,(err,result) => {
            if (err) res.status(500).send(err)

            return res.status(200).send(result)
        })
    },
    getCertainBrand: (req,res) => {
        var sql = `select p.* from products p JOIN brand ON p.brandid= brand.id where brand.id = ${req.params.id} and isdeleted = 0`

        conn.query(sql,(err,result) => {
            if (err) res.status(500).send(err)

            return res.status(200).send(result)
        })
    },
    addBrand: (req,res) => {
        try {
            const path = '/post/images'; //file save path
            const upload = uploader(path, 'POS').fields([{ name: 'logo'}]); //uploader(path, 'default prefix') logo harus sesuai append di ui
    
            upload(req, res, (err) => {
                if(err){
                    return res.status(500).json({ message: 'Upload picture failed !', error: err.message });
                }
    
                const { logo } = req.files;//logo nya sama kaya di ui
                console.log(logo)
                const imagePath = logo ? path + '/' + logo[0].filename : null;
                // console.log(imagePath)
    
                // console.log(req.body.data)
                const data = JSON.parse(req.body.data);
                // console.log(data)
                data.logo = imagePath;
                var sql = 'INSERT INTO brand SET ?';
                conn.query(sql, data, (err, results) => {
                    if(err) {
                        console.log(err.message)
                        fs.unlinkSync('./public' + imagePath);
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                    }
                   
                    console.log(results);
                    sql = `SELECT * FROM brand `;
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
    editBrand: (req,res) => {
        var postId = req.params.id;
        var sql = `SELECT * FROM brand WHERE id = ${postId}`
        conn.query(sql,(err,result)=>{
            if(err) throw err;

            if(result.length > 0) {
                const path = '/post/images'; //file save path
                const upload = uploader(path,'POS').fields([{name:'logo'}]); //uploader(path,default prefix)

                upload(req,res,(err)=>{
                    if(err){
                        return res.status(500).json({message : 'Upload Picture Failed!', error:err.message})
                    }
                    const {logo} = req.files // kalo file ga dikasih logo jadi undefined
                    // console.log(logo);
                    const imagePath = logo ? path + '/' + logo[0].filename : null;
                    const data = JSON.parse(req.body.data)
                    // console.log(data);
                    

                    try{
                        if(imagePath) {
                            data.logo = imagePath;

                        }
                        sql = `UPDATE brand SET ? WHERE id = ${postId}`
                        conn.query(sql,data,(err1,result1)=>{
                            if(err1) {
                                if(imagePath){
                                    fs.unlinkSync('./public' + imagePath);
                                }
                                return res.status(500).json({message : "There's an error on the server. Please contact the administrator.", error :err1.message})    
                            }
                            if(imagePath){
                                fs.unlinkSync('./public' + result[0].logo )
                            }
                            sql = `SELECT * FROM brand`;
                            conn.query(sql,(err2,result2)=>{
                                if(err2){
                                    return res.status(500).json({message : "There's an erro on the server. Please contact the administrator.",error : err1.message})
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
    deleteBrand: (req,res) => {
        console.log(req.body)
        var sql = `DELETE from brand Where id = ${req.params.id}`
        conn.query(sql,(err,result) => {
            if (err) res.status(500).send(err)

            sql=`SELECT * FROM brand`
            conn.query(sql,(err1,result1) => {
                if (err) res.status(500).send(err1)
                console.log(result1)
                return res.status(200).send(result1)
            })
        })
    }

}
