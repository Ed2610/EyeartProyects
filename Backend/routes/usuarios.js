const express = require('express');
const md5 = require('blueimp-md5');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const router = express.Router();
const operador = require("../controllers/usuarios");
const conexion = require('../db/conexion');


router.get('/usuarios', operador.getUsuarios);
router.get('/usuarios/:id', operador.getUsuario);
router.post('/usuarios/', operador.postUsuario);
router.put('/usuarios/:id', operador.putUsuario);
router.delete('/usuarios/:id', operador.deleteUsuario);

router.post('/login', (req, res)=>{
    const query = 'SELECT * FROM eye.usuario WHERE Correo = ? AND Contrasena = ?';
    const values = [req.body.Correo, md5(req.body.Contrasena)];


    const user = conexion.query(query, values, (error, resultado) => {
        if (error) {
            console.error(error.message);
            return res.json({ error: 'Error en la consulta de la base de datos' });
        }
    
        if (resultado.length > 0) {
            /*let data = JSON.stringify(resultado[0]);
            //const token = jwt.sign(data, 'Usuario');
            res.json({token});*/
        } else {
            res.json('No hay registros con ese id');
        }
    });

})

router.post('/loginapp', (req, res)=>{
    const values = [req.body.Correo, md5(req.body.Contrasena)];
    const query = 'SELECT * FROM eye.usuario WHERE Correo = ? AND Contrasena = ? ';

    conexion.query(query, values, (error, results) => {
        if (error) {
          res.status(500).json({ mensaje: 'Error en el servidor' });
          return;
        }
    
        if (results.length > 0) {
          // Si las credenciales son válidas
          const usuario = results[0]; // Tomar el primer usuario encontrado
          res.json(usuario);
          console.log(usuario);
        } else {
          // Si las credenciales no son válidas
          res.status(401).json({ mensaje: 'Usuario o contraseña incorrecta' });
        }
      });
    });

/*router.post('/test',verifyToken, (req, res)=>{
    res.json('superSecret Amigo');
})

function verifyToken(req, res, next){
    if(!req.headers.authorization) return res.status(401).json('No autorizado');

    const token = req.headers.authorization.substr(7);
    if(token!=''){
       const content =  jwt.verify(token, 'Usuario');
       req.data = content;
       next();

    }
}
*/
module.exports = router;