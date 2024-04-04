const conexion = require('../db/conexion.js')
const md5 = require('blueimp-md5');
const getUsuarios = (req, res) =>{
    const query = 'SELECT * FROM eye.usuario ';
    conexion.query(query, (error, resultado)=>{
        if(error) return console.error(error.message)
        if(resultado) {
            console.log(resultado);
            res.json(resultado);
        }
        
    })
}

const getUsuario = (req, res) =>{
    const {id} = req.params;
    const query = 'SELECT * FROM eye.usuario WHERE idUsuario = '+id;
    conexion.query(query, (error, resultado)=>{
        if(error) return console.error(error.message)

        if(resultado){
            console.log(resultado);
            res.json(resultado);
        }else{
            res.json('No hay registros con ese id')
        }
    })

}

const postUsuario = (req, res) =>{
    const usuario = {
    Nombre: req.body.Nombre,
    Apellido: req.body.Apellido,
    NumeroDocumento: req.body.NumeroDocumento,
    Direccion: req.body.Direccion,
    Telefono: req.body.Telefono,
    Correo: req.body.Correo,
    Contrasena: md5(req.body.Contrasena),
    TipoDocumento_idTipoDocumento: req.body.TipoDocumento_idTipoDocumento,
    Ciudad_idCiudad: req.body.Ciudad_idCiudad
    }
    const query = 'INSERT INTO eye.usuario SET ?';
    conexion.query(query, usuario, (error, resultado)=>{
        
        if(error) return console.error(error.message)

        if(resultado){
            console.log(resultado); 
            res.json(resultado);
        }else{
            res.json('ERROR')
        }
    })
    
}

const putUsuario = (req, res) =>{
    const {id} = req.params;
       const {Nombre} = req.body;
       const {Apellido} = req.body;
       const {NumeroDocumento} = req.body;
       const {Direccion} = req.body;
       const {Telefono} = req.body;
       const {Correo} = req.body;
       const {TipoDocumento_idTipoDocumento}= req.body;
       const {Ciudad_idCiudad} = req.body;
    
       const query = `UPDATE usuario SET 
       Nombre = "${Nombre}",
       Apellido = "${Apellido}",
       NumeroDocumento = ${NumeroDocumento},
       Direccion = "${Direccion}",
       Telefono = ${Telefono},
       Correo = "${Correo}",
       TipoDocumento_idTipoDocumento = ${TipoDocumento_idTipoDocumento},
       Ciudad_idCiudad = ${Ciudad_idCiudad}
       WHERE idUsuario = ${id};`;
   
    conexion.query(query,(error, resultado)=>{
        if(error) return console.error(error.message)

        if(resultado){
            console.log(resultado);
            res.json(resultado);
        }else{
            res.json('No hay registros con ese  id')
        }
    })
}

const deleteUsuario = (req, res) =>{
const {id} = req.params;
const query = 'DELETE FROM usuario WHERE idUsuario = '+id;
conexion.query(query, (error, resultado)=>{
    if(error) return console.error(error.message)

    if(resultado){
        console.log(resultado); 
        res.json(resultado);
    }else{
        res.json('No hay registros con ese ID')
    }
})
}

module.exports = {
    getUsuario,
    getUsuarios, 
    postUsuario, 
    putUsuario, 
    deleteUsuario,
}