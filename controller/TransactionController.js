const conn = require('../database')
const { uploader } = require('../helpers/uploader')
const fs = require('fs')

module.exports = {
    statusAceptedByAdmin: (req,res) => {
        var sql = `UPDATE transaction SET status='accepted by admin' WHERE id=${req.params.id}`

        conn.query(sql,(err,result) => {
            if(err) return res.status(500).send(err)

           res.status(200).send(result)
        
         })
    },  
    uploadImagePayment: (req,res) => {
        try {
            const path = '/post/images'; //file save path
            const upload = uploader(path, 'POS').fields([{ name: 'image_upload'}]); //uploader(path, 'default prefix') image_upload harus sesuai append di ui
    
            upload(req, res, (err) => {
                if(err){
                    return res.status(500).json({ message: 'Upload picture failed !', error: err.message });
                }
    
                const { image_upload } = req.files;//image_upload nya sama kaya di ui
                console.log(image_upload)
                const imagePath = image_upload ? path + '/' + image_upload[0].filename : null;
                
                var sql = `Update transaction SET image_upload = '${imagePath}', status='image being checked'  where id=${req.params.id}`;
                conn.query(sql,(err, results) => {
                    if(err) {
                        console.log(err.message)
                        fs.unlinkSync('./public' + imagePath);
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                    }
                   
                    res.status(200).send(results)
                })    
            })
        } catch(err) {
            return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
        }
    },

    statusPackageDelivered: (req,res) => {
        var sql=`UPDATE transaction SET status = 'package delivered' WHERE id= ${req.params.id}`
        
        conn.query(sql,(err,result) => {
            if(err) return res.status(500).send(err)

            sql = `UPDATE products p JOIN transaction_item ti ON p.id = ti.productid
                JOIN transaction t ON t.id =ti.transactionid SET stock= stock-qty Where ti.transactionid=${req.params.id}`

            conn.query(sql,(err,result1) => {
            if(err) return res.status(500).send(err)
                return res.status(200).send(result1)
            })
        })
    },

    statusPackageReceived: (req,res) => {
        var sql=`UPDATE transaction SET status = 'package received' WHERE id=${req.params.id}`

        conn.query(sql,(err,result) => {
            if(err) return res.status(500).send(err)

            return res.status(200).send(result)
        })
    },

    statusRejectedByAdmin: (req,res) => {
        var sql =`UPDATE transaction SET  status ='rejected by admin' WHERE id=${req.params.id}`
        conn.query(sql,(err,result) => {
            if(err) return res.status(500).send(err)

            return res.status(200).send(result)
        })
    }
}