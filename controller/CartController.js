const conn = require('../database')


module.exports ={ 
    AddCart: (req,res) => {
        console.log(req.body)
        let { productid, price, qty, username} = req.body.data
       var sql = `SELECT * FROM cart WHERE productid=${productid} and username='${username}'`
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

           }
           conn.query(sql,dataToDb,(err,result) => {
           if(err) return res.status(500).send(err)

           sql = `SELECT c.id, c.productid, c.qty, c.price, c.totalprice, p.name
           FROM cart c JOIN products p ON c.productid = p.id WHERE username='${req.user.username}'`
           conn.query(sql,(err,hasilCartUser) => {
           if(err) return res.status(500).send(err)
            
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
        FROM cart c JOIN products p ON c.productid = p.id WHERE username='${req.user.username}'`
        conn.query(sql,(err,hasilCartUser) => {
            if(err) return res.status(500).send(err)
            console.log(hasilCartUser)
            return res.status(200).send({
                cartUser: hasilCartUser,
                cartCount: hasilCartUser.length
            })
        })
    }
}