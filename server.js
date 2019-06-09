const express = require("express");
const mysql = require("mysql");
const app = express();

// CHANGE TO YOUR OWN CONNECTION SETTINGS!
var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "sandsofegypt"
});

connection.connect(err => {
  if (err) {
    console.error("Error connecting: " + err.stack);
    return;
  }

  console.log("Connect as ID: " + connection.threadId);
});

app.get("/api/saveScore", (req, res) => {
  var user = {
    userID: req.query.userID,
    nameuser: req.query.nameuser,
    score: req.query.score
  };

  var session = {
    sessionID: req.query.sessionID,
    userID: req.query.userID,
    nameuser: req.query.nameuser
  };
  connection.query("INSERT INTO user SET ?", user, (err, results, fields) => {
    if (err) {
      res.sendStatus(400);
      throw err;
    }
  });

  connection.query(
    "INSERT INTO clientsession SET ?",
    session,
    (err, results, fields) => {
      if (err) {
        res.sendStatus(400);
        throw err;
      }
      if (results) {
        res.sendStatus(200);
      }
    }
  );
});

app.listen(3000, () => {
  console.log("Server up on port 3000.");
});
