const express = require('express');
const router = express.Router();
const operador = require("../controllers/categorias");

router.get('/categorias', operador.getCategorias);
router.get('/categorias/:id', operador.getCategoria);
router.post('/categorias/', operador.postCategorias);
router.put('/categorias/:id', operador.putCategorias);
router.delete('/categorias/:id', operador.deleteCategorias);

module.exports = router;