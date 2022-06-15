const http = require('http');
const path = require('path');
const morgan = require('morgan');
//const mysql = require('mysql');
//const myConnection = require('express-myconnection')
//const session = require('express-session');


//import routes
const routes = require('./routes/routes')

var express = require('express');
var app = express();

// set the view engine to ejs
app.set('view engine', 'ejs');

//static files
//carpeta public se usa en varias partes de la app
app.use(express.static(path.join(__dirname, 'public')));

// use res.render to load up an ejs view file

// about page
app.get('/about', function(req, res) {
  res.render('pages/about');
});

// home screen
app.get('/homeScreen', function(req, res) {
  res.render('pages/homeScreen');
});

//routes
//Main page -> '/'
app.use('/', routes);


app.listen(8080);
console.log('Server is listening on port 8080');