const checkToken = (req, res, next)=>{
    if(!req.headers['authorization']) {
        return res.json({error: ''})
    }

    next();
}



module.exports = {
    checkToken
}