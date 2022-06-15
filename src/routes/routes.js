//Encargado de redireccionar según peticiones
const { render } = require('ejs');
const express = require('express');
const router = express.Router();

//controladores
//Controlador hoteles
//const controladorHotel = require('../controllers/controladorHoteles');
//Controlador gerentes
//const controladorGerente = require('../controllers/controladorGerentes');

//Utilities
const utilities = require('../utilities/utilities');

//sign in
router.get('/singin', (req, res) => {
    res.render('pages/signin');
})

//Pantalla Inicial
/* 
router.get('/', (req, res) => {
    req.getConnection((err, conn) => {
        conn.query('SELECT * FROM hotel WHERE borrado = false;', (err, rows) => {
            console.log(rows[0]);
            res.render('index', {
                hoteles: rows
            });
        });
    });
}); 

*/

module.exports = router;