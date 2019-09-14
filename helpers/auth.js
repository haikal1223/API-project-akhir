const jwt = require ('jsonwebtoken');

module.exports = {
    auth : (req, res, next) => {
        // console.log(req.method)
        if (req.method !== "OPTIONS") {
            // let success = true;
            jwt.verify(req.token, "dota", (error, decoded) => {
                console.log('auth')
                console.log(req.token)
                console.log(req.headers.authorization)
                if (error) {
                    // success = false;
                    return res.status(401).json({ message: "User not authorized.", error: "User not authorized." });
                }
                console.log(decoded)
                req.user = decoded;
                next();
            });
        } else {
            next();
        }
    }
}
