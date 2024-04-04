/*const moduleName = "usuario";

app.get(`/${moduleName}`, (req, res) => {
    console.log('ejecutando query');
    const query = `SELECT * FROM ${moduleName}`
    conexion.query(query, (error, resultado) => {
        if(error) return console.error(error.message)

        if (resultado) {
            console.log(resultado); 
            res.json(resultado);
            }
        });
})

app.get(`/${moduleName}/:id`,(req,res)=>{
    const {id} = req.params;
    const query = `SELECT * FROM ${moduleName} WHERE id=${id}`;
    conexion.query(query, (error, resultado)=>{
        if(error) return console.error(error.message)

        if(resultado){
            console.log(resultado); 
        res.json(resultado);
        }else{
            res.json('No hay registros con ese ID')
        }
    })
})

app.delete(`/${moduleName}/:id`,(req,res)=>{
    const {id} = req.params;
    const query = `DELETE FROM ${moduleName} WHERE id=${id}`;
    conexion.query(query, (error, resultado)=>{
        if(error) return console.error(error.message)

        if(resultado){
            console.log(resultado); 
            res.json(resultado);
        }else{
            res.json('No hay registros con ese ID')
        }
    })
})

app.post(`/${moduleName}/`,(req,res)=>{
    
    const producto = {
        id: req.body.id,
        descripcion: req.body.descripcion,
        precio: req.body.precio
    }
    const query = `INSERT INTO ${moduleName} SET ?`;
    conexion.query(query, producto, (error, resultado)=>{
        if(error) return console.error(error.message)

        if(resultado){
            console.log(resultado); 
            res.json(resultado);
        }else{
            res.json('No hay registros con ese ID')
        }
    })
})

app.put(`/${moduleName}/:id`,(req,res)=>{
    const {id} = req.params;
    const {descripcion, precio} = req.body;
    const query = `UPDATE ${moduleName} set descripcion = '${descripcion}', precio = '${precio}' where id=`+id;
    conexion.query(query, (error, resultado)=>{
        if(error) return console.error(error.message)   

        if(resultado){
            console.log(resultado); 
            res.json(resultado);
        }else{
            res.json('No hay registros con ese ID')
        }
    })
})*/