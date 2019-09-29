const conn = require('../database')

module.exports = {
    getCategory: (req,res) => {
        var sql = `SELECT * FROM category where isdeleted=0`

        conn.query(sql,(error,result)=>{
            if(error) return res.status(500).send(error)

            return res.status(200).send(result)
        })
    },
    getCertainCategory: (req,res) => {
        if(!req.params.page){
            req.params.page=1
        }

        offset = req.params.page * 6 - 6

        var sql = `select p.* from products p JOIN category ON p.categoryid = category.id where category.id = ${req.params.id} and p.isdeleted = 0 `
        
        conn.query(sql,(err,result) => {
            if(err) return res.status(500).send(result) 

            sql+= `limit ${offset}, 6`

            conn.query(sql,(error,result1) => {
                if(error) return res.status(500).send(error)
    
                res.status(200).send({
                    dataProduct: result1,
                    totalPagesCat:result.length,
                    pagesCat: Number(req.params.page)
                })
                })
        });
    },
    addCategory: (req,res) => {
        var data = req.body
        var sql = `INSERT INTO category Set ?`
        conn.query(sql,data,(err,result) => {
            if(err) return res.status(500).send(err)

            var sql = `SELECT * FROM category where isdeleted = 0`
            conn.query(sql,(err1,result) => {
                if (err1) return res.status(500).send(err1)

                return res.status(200).send(result)
            })
        })
    },
    editCategory: (req,res) => {
        var sql = `UPDATE category SET ? WHERE id = ${req.params.id}`
        conn.query(sql,req.body,(err,result) => {
            if (err) return res.status(500).send(err)

            sql = `SELECT * FROM category where isdeleted = 0`
            conn.query(sql,(err,result1) =>{
                if (err) return res.status(500).send(err)

                res.status(200).send(result1)
            })
        })
    },
    deleteCategory: (req,res) => {
        var sql = `DELETE from category WHERE id = ${req.params.id}`
        conn.query(sql,(err,result) => {
            if (err) return res.status(500).send(err)

            sql = `SELECT * FROM category WHERE isdeleted=0`
            conn.query(sql,(err,result1) =>{
                if (err) return res.status(500).send(err)

                res.status(200).send(result1)
            })
        })
    }
}