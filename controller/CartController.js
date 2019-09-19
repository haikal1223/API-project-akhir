const conn = require('../database')


module.exports ={ 
    AddCart: (req,res) => {
        console.log(req.body)
        let { productid, price, qty, username} = req.body.data
        console.log(req.body.data)
       var sql = `SELECT * FROM cart WHERE productid=${productid} and username='${username}' and isdeleted=0`
       conn.query(sql,(err,result) => {
           if(err) return res.status(500).send(err)
            
           if(result.length === 0){
            var dataToDb = {
                productid,
                price,
                qty,
                username,
                totalprice: price * qty
            };
            sql=`INSERT INTO cart SET ?`
           }else{
                var dataToDb = {
                    qty:result[0].qty + qty,
                    totalprice: (qty*price) + result[0].totalprice

                }
                sql=`UPDATE cart SET ? WHERE productid=${productid} and username ='${username}' and isdeleted = 0`
           }
           conn.query(sql,dataToDb,(err,result) => {
           if(err) return res.status(500).send(err)

           sql = `SELECT c.id, c.productid, c.qty, c.price, c.totalprice, p.name
           FROM cart c JOIN products p ON c.productid = p.id WHERE c.username='${username}' and c.isdeleted = 0`
           conn.query(sql,(err,hasilCartUser) => {
           if(err) return res.status(500).send(err)
            console.log(hasilCartUser)
           return res.status(200).send({
               cartUser: hasilCartUser,
               cartCount: hasilCartUser.length
            })
           })
           })
       })
    },
    getCart: (req,res) => {
        
        var sql = `SELECT c.id, c.productid, c.qty, c.price, c.totalprice, p.name
        FROM cart c JOIN products p ON c.productid = p.id WHERE c.username='${req.user.username}' and c.isdeleted = 0`
        conn.query(sql,(err,hasilCartUser) => {
            if(err) return res.status(500).send(err)
            console.log(hasilCartUser)
            return res.status(200).send({
                cartUser: hasilCartUser,
                cartCount: hasilCartUser.length
            })
        })
    },
    addCheckOut: (req,res) => {
        console.log(req.body.transaction)
        var data = req.body.transaction
        data.tanggal = new Date()
        var sql = `INSERT INTO transaction SET ?`
        conn.query(sql,data,(err,result) => {
            if(err) return res.status(500).send(err)

            var arrTI = []

            req.body.transactionItem.forEach(item => {
                arrTI.push([item.productid,item.price,item.qty,result.insertId])
            });

            sql = `INSERT INTO transaction_item (productid,harga,qty,transactionid) VALUES ?`

            conn.query(sql,[arrTI],(err,result1) => {
                if(err) return res.status(500).send(err)
                
                sql=``

                req.body.transactionItem.forEach(item => {
                    sql+=`UPDATE cart SET isdeleted = 1 WHERE productid=${item.productid} and isdeleted=0;`
                });
                conn.query(sql,(err,result3) => {
                 if(err) return res.status(500).send(err)

                 return res.status(200).send(result3)
                })
            })
        })
    },
    getTransaction: (req,res) => {
        var sql = `SELECT * FROM transaction WHERE username='${req.params.username}'`

        conn.query(sql,(err,result) => {
            if(err) res.status(500).send(err)

            return res.status(200).send(result)
        })
    },
    getTransactionAdmin:(req,res) => {
        var sql = `SELECT t.*, ti.productid, ti.harga, ti.qty FROM transaction t JOIN transaction_item ti ON t.id = ti.transactionid JOIN products p ON ti.productid = p.id`
        conn.query(sql,(err,result) => {
            if(err) res.status(500).send(err)

            return res.status(200).send(result)
        })
    },
    deleteCart: (req,res) => {
        console.log(req.body)
        var {username, productid} = req.body
        var sql = `UPDATE cart SET isdeleted = 1 WHERE productid=${productid} and username='${username}' and isdeleted=0`

        conn.query(sql,(err,result) => {
            if(err) res.status(500).send(err)
            console.log(result)

             sql = `SELECT c.id, c.productid, c.qty, c.price, c.totalprice, p.name
            FROM cart c JOIN products p ON c.productid = p.id WHERE c.username='${username}' and c.isdeleted = 0`
            conn.query(sql,(err,hasilCartUser) => {
                if(err) return res.status(500).send(err)
                console.log(hasilCartUser)
                return res.status(200).send({
                    cartUser: hasilCartUser,
                    cartCount: hasilCartUser.length
                })
            })
        })
    },
    getTransactionDetail: (req,res) => {
        var sql = `SELECT ti.transactionid, ti.qty, ti.harga, ti.productid, p.name FROM transaction_item ti LEFT JOIN products p ON ti.productid = p.id JOIN transaction t ON ti.transactionid = t.id where ti.transactionid=${req.params.id}`
        conn.query(sql,(err,result) => {
            if(err) res.status(500).send(err)

            return res.status(200).send(result)
        })
    }
}