var express = require('express');
var app = express();
const path = require ('path');

//setting middleware
app.use(express.static(path.join(__dirname, 'public')));


app.listen(8080, ()=>{
    console.log ("Server listening on port 8080 ...")
});