const express = require("express");
const bodyParser = require("body-parser");
const routes = require("./routes/routes.js");
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const cors=require("cors");
const corsOptions ={
   origin:'*', 
   credentials:true,            //access-control-allow-credentials:true
   optionSuccessStatus:200,
}

app.use(cors(corsOptions)) // Use this after the variable declaration

routes(app);

var server = app.listen(8080, function () {
    console.log("Yo! This app is running on port.", server.address().port);
});