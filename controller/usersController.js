const conn = require('../database')
const crypto = require('crypto')
const transporer = require('../helpers/mailer')
const { createJWTToken } = require('../helpers/jwt')

module.exports = {
    register: (req,res) => {
        var {username, password, email} = req.body;

        var sql = `SELECT username FROM users WHERE username='${username}'`
        conn.query(sql,(err,result) => {
            if(err){
                return res.status(500).send({status: 'error',err})
            }

            if(result.length > 0){
                return res.status(200).send({status: 'error', message: 'Username has been taken!'})
            }else{
                var hashPassword = crypto.createHmac('sha256','theKey')
                                    .update(password).digest('hex')
                
                var dataUser = {
                    username,
                    password: hashPassword,
                    email,
                    statusid: 1,
                    roleid: 2,
                    lastLogin: new Date()
                }
                sql = `INSERT INTO users SET ?`;
                conn.query(sql,dataUser,(err1,result1) => {
                    if(err1){
                        return res.status(500).send({status: 'error',err: err1})
                    }

                    var linkVerifikasi = `http://localhost:3000/verified?username=${username}&password=${hashPassword}`
                    var mailOption = {
                        from: 'Admin Furion Industries <muhammadhaikal507@gmail.com>',
                        to: email,
                        subject: 'Verification Email for Furion Industries',
                        html: `Please click this link for verification: <a href="${linkVerifikasi}"> Join Us Now! </a>`
                    }

                    transporer.sendMail(mailOption,(err2,res2) => {
                        if(err2) {
                            return res.status(500).send({status: 'error', err:err2})
                        }

                        return res.status(200).send({username,email,statusid: 1})
                    })
                })
            }
        })
    },
    emailVerifikasi: (req,res) => {
        var { username, password } = req.body
        var sql = `SELECT username,email FROM users WHERE username='${username}'`
        conn.query(sql,(err,result) => {
            if(err) return res.status(500).send({status: 'error',err})

            if(result.length === 0){
                return res.status(500).send({status:'error', err: 'User Not Found!'})
            }
            
            sql = `UPDATE users SET statusid=2 WHERE username='${username}' AND password='${password}' `
            conn.query(sql,(err,result1) => {
                if(err) return res.status(500).send({status:'error',err})

                res.status(200).send({username: result[0].username, email: result[0].email, statusid: 1})
                console.log(result)
            })
        })
    },
    resendEmailVer: (req,res) => {
        var { username, email } = req.body
        var sql = `SELECT username,password,email FROM users WHERE username='${username}' AND email='${email}'`
        conn.query(sql,(err,result) => {
            if(err) return res.status(500).send({status: 'error',err})

            if(result.length === 0){
                return res.status(500).send({status:'error', err: 'User Not Found!'})
            }
            
            var linkVerifikasi = `http://localhost:3000/verified?username=${result[0].username}&password=${result[0].password}`
                    var mailOption = {
                        from: 'Admin Furion Industries <muhammadhaikal507@gmail.com>',
                        to: result[0].email,
                        subject: 'Verification Email for Furion Industries',
                        html: `Please click this link for verification: <a href="${linkVerifikasi}"> Join Us Now! </a>`
                    }

                    transporer.sendMail(mailOption,(err2,res2) => {
                        if(err2) {
                            return res.status(500).send({status: 'error', err:err2})
                        }

                        return res.status(200).send({username,email,statusid: 1})
                    })
           
        })
    },
    login: (req,res) => {
        var {username, password} = req.body
        console.log(req.body)
        var hashPassword = crypto.createHmac('sha256','theKey')
                                .update(password).digest('hex')
        var sql = `SELECT * FROM users WHERE username='${username}' AND password='${hashPassword}'`
        conn.query(sql,(err,result) => {
            if(err) return res.status(500).send({status: 'error',err})

            if(result.length === 0) {
                return res.status(200).send({status: 'error', message: 'Username or Password Incorrect!'})
            }
            console.log('ini result di login')
            console.log(result)
            const token = createJWTToken({userId: result[0].id, username: result[0].username})
            console.log(token)
            res.status(200).send({username, email: result[0].email, status: result[0].statusid, roleid:result[0].roleid, token})
        })
    },
    keepLogin : (req,res) => {
        console.log(req.user)
        var sql = `SELECT * FROM users WHERE id=${req.user.userId}`
        conn.query(sql,(err,result)=>{
            if(err) return res.status(500).send({status : 'error', err})

            if(result.length === 0){
                return res.status(500).send({status : 'error', err : 'User Not Found !'})
            }

            const token = createJWTToken({userId : result[0].id,username : result[0].username})
            
            res.status(200).send({username : result[0].username,email : result[0].email,status : result[0].status, roleid: result[0].roleid,token})
            // console.log(result);
            
        })
    }
}