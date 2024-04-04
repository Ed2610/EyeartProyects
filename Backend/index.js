const bodyParser = require('body-parser');
const cors = require('cors');
const express = require('express');
const db = require('./db/conexion.js');
const rutasCategorias = require('./routes/categorias.js');
const rutasProductos = require('./routes/productos.js');
const rutasUsuario = require('./routes/usuarios.js');
const controlesCategorias = require('./controllers/categorias.js');
const app = express();
const checkToken = require('./midlewares.js');
const ciudad = require('./ciudad.js');
const pedido = require('./pedido.js');
const usuario = require('./usuario.js');

app.use(function(req, res, next) {
         res.setHeader('Access-Control-Allow-Origin', '*')
         res.setHeader('Access-Control-Allow-Methods', '*')
        res.header('Access-Control-Allow-Origin', '*')
        res.header('Access-Control-Allow-Methods', '*')
         next()
    })


    app.use(cors({
        origin: ['*'],
        methods: ['GET', 'POST', 'PUT', 'DELETE'], // Allowed HTTP methods (adjust as needed)
        allowedHeaders: ['Content-Type', 'Authorization', 'X-Requested-With', 'Origin', 'Accept'], // Allowed headers
        credentials: true // Allow cookies for cross-origin requests (if applicable)
      }));
      
      
    

app.use(bodyParser.json())
const PUERTO = 3000;

db.connect(error=>{
    if(error) throw error
    console.log('Conexion a la base de datos exitosa');
})


app.listen(PUERTO, ()=>{
    console.log('Servidor iniciado en el puerto '+PUERTO);
})

app.use(rutasCategorias);

app.use(rutasProductos);

app.use(rutasUsuario);

ciudad.RegisterCiudad(app);
pedido.RegisterPedido(app);
usuario.Register(app);
