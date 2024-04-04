const moduleName = "itemscarrito"
const conexion = require('./db/conexion')

// -- LISTAR ITEMS CARRITO --
function RegisterItemsCarrito(app){
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
        const query = `SELECT * FROM ${moduleName} WHERE idItem=${id}`;
        conexion.query(query, (error, resultado)=>{
            if(error) return console.error(error.message)
    
            if(resultado.length > 0){
                console.log(resultado); 
            res.json(resultado);
            }else{
                res.json('No hay registros con ese Carrito')
            }
        })
    })

// -- AGREGAR ITEMS CARRITO  --
app.post(`/${moduleName}/agregar`,(req,res)=>{
        
    const producto = {
        Cantidad: req.body.Cantidad,
        Carrito_idCarrito: req.body.Carrito_idCarrito,
        Producto_idProducto: req.body.Producto_idProducto,
    }
    const query = `INSERT INTO ${moduleName} SET ?`;
    conexion.query(query, producto, (error, resultado)=>{
        if(error) return console.error(error.message)

        res.json(`Se ha insertado correctamente`)
    })
})

// -- ACTUALIZAR ITEMS CARRITO  --
    app.put(`/${moduleName}/editar/:id`,(req,res)=>{
        const {id} = req.params;
        const {Cantidad, Producto_idProducto } = req.body;
        const query = `UPDATE ${moduleName} SET Cantidad = '${Cantidad}', Producto_idProducto = '${Producto_idProducto}'
                 WHERE idItem=${id}`;
        conexion.query(query, (error, resultado)=>{
            if(error) return console.error(error.message)   
    
            res.json(`Se ha Actualizado correctamente`)
        })
    })

// -- ELIMINAR ITEMS CARRITO  --
    app.delete(`/${moduleName}/:id`,(req,res)=>{
        const {id} = req.params;
        const query = `DELETE FROM ${moduleName} WHERE idItem=${id}`;
        conexion.query(query, (error, resultado)=>{
            if(error) return console.error(error.message)
    
            res.json(`Se ha Eliminado correctamente`)
        })
    })

}




module.exports = {RegisterItemsCarrito};