const conn = require('../database')
const { uploader } = require('../helpers/uploader')
const fs = require('fs')

module.exports = {
    getSlider: (req,res) => {
        var sql = 'SELECT * FROM jumbo_slider'

        conn.query(sql,(err,result) => {
            if (err) res.status(500).send(err)

            res.status(200).send(result)
        })
    },
    addSlider: (req,res) => {
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
                const data = { image: imagePath}
                // data.image = imagePath;
                var sql = 'INSERT INTO jumbo_slider SET ?';
                conn.query(sql, data, (err, results) => {
                    if(err) {
                        console.log(err.message)
                        fs.unlinkSync('./public' + imagePath);
                        return res.status(500).json({ message: "There's an error on the server. Please contact the administrator.", error: err.message });
                    }
                   
                    console.log(results);
                    sql = `SELECT * FROM jumbo_slider `;
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
    deleteSlider:(req,res) => {
        var sql = `DELETE FROM jumbo_slider WHERE id=${req.params.id}`

        conn.query(sql,(err,result) => {
            if(err) return res.status(500).send(err)

            return res.status(200).send(result)
        })
    }
}
