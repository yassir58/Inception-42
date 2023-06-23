var express = require('express');
var app = express();
const path = require ('path');
const port = 1234 ;

//setting middleware
app.use(express.static(path.join(__dirname, 'public')));


app.listen(port, ()=>{
    console.log ("Server listening on port 8080 ...")
});