const moduleName = "ciudad"
const conexion = require('./db/conexion')


// -- LISTAR CIUDAD --
function RegisterCiudad(app){
    app.get(`/${moduleName}`, (req, res) => {
        console.log('ejecutando query');
        const query = `SELECT * FROM ${moduleName}`
        conexion.query(query, (error, resultado) => {
            if(error) return console.error(error.message)
    
            if(resultado.length > 0) {
                res.json(resultado)
            }else{
                res.json('No hay registros')
            }
            });
    })
    
// -- LISTAR MEDIANTE ID --
    app.get(`/${moduleName}/:id`,(req,res)=>{
        const {id} = req.params;
        const query = `SELECT * FROM ${moduleName} WHERE idCiudad=${id}`;
        conexion.query(query, (error, resultado)=>{
            if(error) return console.error(error.message)
    
            if(resultado.length > 0){
                console.log(resultado); 
            res.json(resultado);
            }else{
                res.json('No hay registros con ese ID')
            }
        })
    })

// -- AGREGAR CIUDAD --
app.post(`/${moduleName}/agregar`,(req,res)=>{
        
    const ciudad = {
        descripcion: req.body.descripcion,
    }
    const query = `INSERT INTO ${moduleName} SET ?`;
    conexion.query(query, ciudad, (error, resultado)=>{
        if(error) return console.error(error.message)

        res.json(`Se insertó correctamente`)

    })
})

// -- ACTUALIZAR CIUDAD --
    app.put(`/${moduleName}/editar/:id`,(req,res)=>{
        const {id} = req.params;
        const {descripcion} = req.body;
        const query = `UPDATE ${moduleName} SET Descripcion = '${descripcion}' WHERE idCiudad=${id}`;
        conexion.query(query, (error, resultado)=>{
            if(error) return console.error(error.message)   
    
            res.json("Se ha actualizado correctamente");
        })
    })

// -- ELIMINAR CIUDAD --
    app.delete(`/${moduleName}/:id`,(req,res)=>{
        const {id} = req.params;
        const query = `DELETE FROM ${moduleName} WHERE idCiudad=${id}`;
        conexion.query(query, (error, resultado)=>{
            if(error) return console.error(error.message)
    
            res.json("Se ha eliminado correctamente");
        })
    })
}




module.exports = {RegisterCiudad};