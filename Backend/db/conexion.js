const mysql = require('mysql2');

const conexion = mysql.createConnection({
    host:'localhost',
    database:'eye',
    user:'root',
    password:''
});

module.exports = conexion;