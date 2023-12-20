const { verify } = require("jsonwebtoken");
const sql = require("../Config/MYSQL_Configuration");
const Query = require("../Helpers/queryHelper");
class LookUp {
  constructor(LookUp) {
    this.id = LookUp.id;
    this.Name = LookUp.Name;
    this.Code = Permission.Code;
    this.type = LookUp.type;
    this.is_active = LookUp.is_active;
    this.LookUPDetailsId = LookUp.LookUPDetailsId;
  }
  static async GetAllGame(result) {
    try {
      console.log("GetAllGame");
      var myQuery = `SELECT lookups.id, lookups.name, lookups.code AS lookup_code, lookups.is_active, lookups.lookup_detail_id ,lookups.type, lookup_types.code AS lookup_types_code  FROM lookups INNER JOIN lookup_types ON lookup_types.id = lookups.type WHERE lookups.type=1; 
    `;
      const res = await Query.execute(myQuery);
     

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
  static async GetAllTeams(result) {
    try {
      console.log("GetAllTeams");
      var myQuery = `SELECT lookups.id, lookups.name, lookups.code AS lookupCode, lookups.is_active, lookups.lookup_detail_id ,lookups.type, lookup_types.code AS lookup_types_code  FROM lookups INNER JOIN lookup_types ON lookup_types.id = lookups.type WHERE lookups.type=2; 
      `;
      const res = await Query.execute(myQuery);
      
      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
  static async GetAllTransactionTypes(result) {
    try {
      console.log("GetAllTransactionTypes");
      var myQuery = `SELECT lookups.id, lookups.name, lookups.code AS lookup_code, lookups.is_active, lookups.lookup_detail_id ,lookups.type, lookup_types.code AS lookup_types_code  FROM lookups INNER JOIN lookup_types ON lookup_types.id = lookups.type WHERE lookups.type=4; 
    `;
      const res = await Query.execute(myQuery);
     

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
  static async GetAllShift(result) {
    try {
      console.log("GetAllShift");
      var myQuery = `SELECT lookups.id, lookups.name, lookups.code AS lookupCode, lookups.is_active, lookups.lookup_detail_id ,lookups.type, lookup_types.code AS lookup_types_code  FROM lookups INNER JOIN lookup_types ON lookup_types.id = lookups.type WHERE lookups.type=5; 
      `;
      const res = await Query.execute(myQuery);
      
      result(null, res);
    } catch (e) {
      result(r, null);
    }
  }
  static async GetAllUserTeams(body, result) {
    try {
      console.log("GetAllUserTeams");
      var myQuery =
        " SELECT lookups.id, lookups.name, lookups.type, lookups.code, lookups.is_active FROM user_lookups INNER JOIN lookups ON lookups.id = user_lookups.lookup_id WHERE user_lookups.user_id = " +
        body.UserID +
        " AND lookups.type = 2 AND user_lookups.is_active=1 AND lookups.is_active=1;";
      const res = await Query.execute(myQuery);
      
      result(null, res);
    } catch (e) {
      result(r, null);
    }
  }
  static async GetAllUserGame(body, result) {
    try {
      console.log("GetAllUserGame");
      var myQuery =
        "SELECT lookups.id, lookups.name, lookups.type, lookups.code, lookups.is_active FROM user_lookups INNER JOIN lookups ON lookups.id = user_lookups.lookup_id " +
        " WHERE user_lookups.user_id =" +
        body.UserID +
        " AND lookups.type = 1 AND user_lookups.is_active=1 AND lookups.is_active=1;";

      const res = await Query.execute(myQuery);
     
      result(null, res);
    } catch (e) {
      result(r, null);
    }
  }
  static async GetAllUserShift(body, result) {
    try {
      console.log("GetAllUserShift");
      var myQuery =
        " SELECT lookups.id, lookups.name, lookups.type, lookups.code, lookups.is_active FROM user_lookups" +
        " INNER JOIN lookups ON lookups.id = user_lookups.lookup_id WHERE user_lookups.user_id =" +
        body.UserID +
        " AND lookups.type = 5  AND user_lookups.is_active=1 AND lookups.is_active=1 ";
      const res = await Query.execute(myQuery);
      
      result(null, res);
    } catch (e) {
      result(r, null);
    }
  }
  static async GetAllStatus(result) {
    console.log("GetAllUserShift");
    var myQuery = ` SELECT * FROM attendance_status
    `;
    const res = await Query.execute(myQuery);
    
    result(null, res);
  } catch (e) {
    result(r, null);
  }
    
  }


module.exports = LookUp;
