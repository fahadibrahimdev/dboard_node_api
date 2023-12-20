const { verify } = require("jsonwebtoken");
const sql = require("../Config/MYSQL_Configuration");
const Query = require("../Helpers/queryHelper");

class Permission {
  constructor(Permission) {
    this.id = Permission.id;
    this.Name = Permission.Name;
    this.Code = Permission.Code;
    this.Privacy = Permission.Privacy;
    this.Report = Permission.Report;
  }

  static async GetAllPermission(body, result) {
    try {
      console.log("GetAllPermission");
      var myQuery =
        "SELECT permissions.id, permissions.name, permissions.code, permissions.is_active FROM user_permissions INNER JOIN permissions ON permissions.id = user_permissions.permission_id WHERE user_permissions.user_id =" +
        body.UserID +" AND user_permissions.is_active=1 AND permissions.is_active=1";
      const res = await Query.execute(myQuery);
     
      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
}

module.exports = Permission;
