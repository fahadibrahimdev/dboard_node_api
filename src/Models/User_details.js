const { verify } = require("jsonwebtoken");
const sql = require("../Config/MYSQL_Configuration");
const Query = require("../Helpers/queryHelper");
class user_details {
  constructor(user_details) {
    this.user_id = user_details.user_id;
    this.id = user_details.id;
    this.flags = user_details.flags;
  }
  static async Get_All_User_Details(body, result) {
    try {
      console.log("Get All user_details");
      var myQuery =
        "SELECT flags FROM user_details where user_id =" +
        body.UserID;
      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async Update_User_Flags_Details(body, result) {
    try {
      console.log("Update_User_Falgs_Details");
      var myQuery =
        "UPDATE user_details SET flags = CASE WHEN flags = 1 THEN 0 ELSE flags END WHERE user_id = " +
        body.UserID;
      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
}

module.exports = user_details;
