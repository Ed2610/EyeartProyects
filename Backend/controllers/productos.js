const conexion = require('../db/conexion.js')
const itemscarrito = require('../itemscarrito.js');

const getProductos = (req, res)=>{
    const query = 'select * from producto inner join categoria on producto.Categoria_idCategoria = categoria.idcategoria;'
    conexion.query(query, (error, resultado) => {   
        if(error) return console.error(error.message)

        if (resultado) {
            console.log(resultado); 
            res.json(resultado);
          }
        });
};

const getProducto = (req, res)=>{
    
    const {id} = req.params;
    const query = 'SELECT * FROM producto WHERE id=' + id;
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

const postProducto = (req, res)=>{
    
        
    const producto = {
        Nombre: req.body.Nombre,
        DescripcionProducto: req.body.DescripcionProducto,
        Precio: req.body.Precio,
        Stock: req.body.Stock,
        url_foto:req.body.url_foto,
        Categoria_idCategoria:req.body.Categoria_idCategoria

    }
    const query = 'INSERT INTO producto SET ?';
    conexion.query(query, producto, (error, resultado)=>{
        if(error) return console.error(error.message)

        if(resultado){
            console.log(resultado); 
            res.json(resultado);
        }else{
            res.json('No hay registros con ese ID')
        }
    })
}

const putProducto = (req, res)=>{
    
    const {id} = req.params;
    const producto = {
        Nombre: req.body.Nombre,
        DescripcionProducto: req.body.DescripcionProducto,
        Precio: req.body.Precio,
        Stock: req.body.Stock,
        url_foto:req.body.url_foto,
        Categoria_idCategoria:req.body.Categoria_idCategoria

    }
    const query = `UPDATE producto set , Nombre = '${Nombre}',
     DescripcionProducto = '${DescripcionProducto}',
     Precio = '${Precio}',
     Stock = '${Stock}',
     url_foto = '${url_foto}',
     Categoria_idCategoria = '${Categoria_idCategoria}',  where idPropducto='${id}'`;
    conexion.query(query, (error, resultado)=>{
        if(error) return console.error(error.message)

        if(resultado){
            console.log(resultado);
            res.json(resultado);
        }else{
            res.json('No hay registros con ese  id')
        }
    })
}

const deleteProducto = (req, res) => {
    const { id } = req.params;
    const query = 'DELETE FROM producto WHERE idProducto = ?';
    const query2 = 'DELETE FROM itemscarrito WHERE Producto_idProducto = ?';
  
    conexion.query(query, [id], (error, resultado) => {
      if (error) return console.error(error.message);
  
      if (resultado) {
        console.log(resultado);
        res.json(resultado);
      } else {
        res.json('No hay registros con ese ID');
      }
    });
  };
  

module.exports = {
    getProductos,
    getProducto,
    postProducto,
    putProducto,
    deleteProducto,
}