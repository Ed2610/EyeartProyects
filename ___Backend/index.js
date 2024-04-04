const cors = require('cors');

const databaseName = 'eye';
const mysql = require('mysql2');
    conexion = mysql.createConnection({
    host:'localhost',
    database: databaseName,
    user:'root',
    password:''
})

const express = require('express');
const bodyParser = require('body-parser');
const { throws } = require('assert');
const app = express();

app.use(cors());

app.use(function(req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*')
    res.setHeader('Access-Control-Allow-Methods', '*')
    res.header('Access-Control-Allow-Origin', '*')
    res.header('Access-Control-Allow-Methods', '*')
    next()
})

app.use(bodyParser.json())
const PUERTO = 3000;

app.get('/', (req, res) => {
    res.send('APIs');
} )
conexion.connect(error=>{
    if(error) throw error
    console.log('Conexion a base de datos exitosa');
})

app.listen(PUERTO, () => {
    console.log('Servidor iniciado en el puerto: ',PUERTO);
})

function registerAction(entity) {
    app.get(`/${entity}`, (req, res) => {
        console.log('ejecutando query');
        const query = `SELECT * FROM ${entity}`
        conexion.query(query, (error, resultado) => {
            if(error) return console.error(error.message)
    
            if (resultado) {
                console.log(resultado); 
                res.json(resultado);
              }
            });
        })
}

registerAction("producto");

    app.get('/productos/:id',(req,res)=>{
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
    })

    app.delete('/productos/:id',(req,res)=>{
        const {id} = req.params;
        const query = 'DELETE FROM producto WHERE id='+ id;
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

    app.post('/productos/',(req,res)=>{
        
        const producto = {
            id: req.body.id,
            descripcion: req.body.descripcion,
            precio: req.body.precio
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
    })

    app.put('/productos/:id',(req,res)=>{
        const {id} = req.params;
        const {descripcion, precio} = req.body;
        const query = `UPDATE producto set descripcion = '${descripcion}', precio = '${precio}' where id=`+id;
        conexion.query(query, (error, resultado)=>{
            if(error) return console.error(error.message)   
    
            if(resultado){
                console.log(resultado); 
                res.json(resultado);
            }else{
                res.json('No hay registros con ese ID');
            }
        })
    })
