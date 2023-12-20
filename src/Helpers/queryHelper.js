const sql = require("../Config/MYSQL_Configuration");

class Query {

  static async execute (query) {

    console.log("EX Query: ", query );
    
    return new Promise((resolve, reject) => {
      sql.query(query, (err, results) => {
        if (err) {
          reject(err);
        } else {
          resolve(results);
        }
      });
    });
  };
  
  static async executeWithParams (query, params)  {

    console.log("EX Query: ", query );
    return new Promise((resolve, reject) => {
      sql.query(query, params, (err, results) => {
        if (err) {
          reject(err);
        } else {
          resolve(results);
        }
      });
    });
  };
}

module.exports = Query;