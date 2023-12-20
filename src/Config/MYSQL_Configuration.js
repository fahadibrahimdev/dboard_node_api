const ENV_ENUM = require('../Helpers/ENV_ENUM');

var myDBName = '';
if(!!process.env.Environment ) {
  if(process.env.Environment === "UAT") {
    myDBName = ENV_ENUM.UAT.dbName;
  } else if(process.env.Environment === "PROD") {
    myDBName = ENV_ENUM.PROD.dbName;
  }
} else {
  myDBName = ENV_ENUM.UAT.dbName;
}

const mysql = require("mysql");
const con = mysql.createConnection({
  host: "23.106.120.176",
  user: "thundertechsol_mab",
  password: "MABuser123$",
  database: myDBName,
  port: 3306,
});
con.connect(function (err) {
  if (err) {
    console.log("connection failed!");
    console.log("Error!", err);
    throw err;
  }
  console.log("Connected!");
});
module.exports = con;
