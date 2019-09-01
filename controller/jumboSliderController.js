const conn = require('../database')

module.exports = {
    getSlider: (req,res) => {
        var sql = 'SELECT * FROM jumbo_slider'

        conn.query(sql,(err,result) => {
            if (err) res.status(500).send(err)

            res.status(200).send(result)
        })
    }
}