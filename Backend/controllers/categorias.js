const conexion = require('../db/conexion.js')

const getCategorias = (req, res)=>{
    const query ='SELECT * FROM eye.categoria'
    conexion.query(query, (error, resultado) =>{
        if(error) return console.error(error.message)

        if(resultado) {
            console.log(resultado);
            res.json(resultado);
        }
        
    })
};

const getCategoria = (req, res)=>{
    const {id} = req.params;
    const query = 'SELECT * FROM categoria WHERE idCategoria='+id;
    conexion.query(query, (error, resultado)=>{
        if(error) return console.error(error.message)

        if(resultado){
            console.log(resultado);
            res.json(resultado);
        }else{
            res.json('No hay registros con ese id')
        }
    })
};

const postCategorias = (req, res)=>{
    const categoria = {
        idCategoria: req.body.id, 
        descripcion: req.body.descripcion    
    }
    const query = 'INSERT INTO categoria SET ?';
    conexion.query(query, categoria, (error, resultado)=>{
        if(error) return console.error(error.message)

        if(resultado){
            console.log(resultado);
            res.json(resultado);
        }else{
            res.json('Ocurrio un error')
        }
    })
};

const putCategorias = (req, res)=>{
    const {id} = req.params;
    const {descripcion} = req.body;
    const query = `UPDATE categoria set descripcion = '${descripcion}' where idCategoria='${id}'`;
    conexion.query(query, (error, resultado)=>{
        if(error) return console.error(error.message)

        if(resultado){
            console.log(resultado);
            res.json(resultado);
        }else{
            res.json('No hay registros con ese  id')
        }
    })
};

const deleteCategorias = (req, res)=>{
    const {id} = req.params;
    const query = 'DELETE FROM categoria WHERE idCategoria ='+id;
    conexion.query(query, (error, resultado)=>{
        if(error) return console.error(error.message)

        if(resultado){
            console.log(resultado);
            res.json(resultado);
        }else{
            res.json('No hay registros con ese id')
        }
    })
};





module.exports = {
    getCategorias,
    getCategoria,
    postCategorias,
    putCategorias,
    deleteCategorias,
}