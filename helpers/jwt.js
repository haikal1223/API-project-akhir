const jwt = require ('jsonwebtoken');

module.exports = {
    createJWTToken(payload){
        return jwt.sign(payload, "dota", { expiresIn : '12h' })
    }
}