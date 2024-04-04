const express = require('express');
const router = express.Router();
const operador = require("../controllers/productos");

router.get('/productos', operador.getProductos);
router.get('/productos/:id', operador.getProducto);
router.post('/productos/', operador.postProducto);
router.put('/productos/:id', operador.putProducto);
router.delete('/productos/:id', operador.deleteProducto);

module.exports = router;