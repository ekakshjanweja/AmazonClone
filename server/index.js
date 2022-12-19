//IMPORTS FROM PACKACGES

const express = require("express");
const mongoose = require("mongoose");

//IMPORTS FROM OTHER FILES

const authRouter = require("./routes/auth.js");

//INIT

const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://ekaksh:ekaksh31@cluster0.zzaw3jm.mongodb.net/?retryWrites=true&w=majority";

//Middleware

app.use(express.json()); 
app.use(authRouter);

//Connections

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful.");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at port : ${PORT} `);
});
