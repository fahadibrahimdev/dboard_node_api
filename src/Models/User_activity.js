const { verify } = require("jsonwebtoken");
const sql = require("../Config/MYSQL_Configuration");
const { param } = require("../Routes/transactionRouter");
const Query = require("../Helpers/queryHelper");

class User_activity {
  constructor(User_activity) {
    this.id = User_activity.id;
    this.last_login_time = User_activity.last_login_time;
    this.last_logout_time = User_activity.last_logout_time;
    this.last_login_platform = User_activity.last_login_platform;
    this.last_logout_platform = User_activity.last_logout_platform;
    this.device_token = User_activity.device_token;
    this.device_info = User_activity.device_info;
    this.is_session_completed = User_activity.is_session_completed;
    this.id_deleted = User_activity.id_deleted;
  }
  static async UpdateTokenInfoV2(body, result) {
    try {
      console.log("Update Tokens");

      var myQuery =
        "UPDATE `user_activity` SET  `is_session_completed` = 1, `last_logout_time` ='" +
        body.Logout_time +
        "' , `last_logout_platform` = 'FORCE' where user_id =" +
        body.UserID +
        " AND is_session_completed = 0 AND last_login_platform = '" +
        body.Platform +
        "';";

      const res = await Query.executeWithParams(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
  static async insert_user_activity(body, result) {
    try {
      console.log("insert_user_activity ");

      var myQuery =
        "INSERT INTO user_activity (device_token,last_login_platform,user_id,last_login_time,device_info) " +
        "VALUE ( '" +
        body.DeviceToken +
        "','" +
        body.platform +
        "','" +
        body.UserID +
        "','" +
        body.Login_time +
        "','" +
        body.DeviceInfo +
        "');";

      const res = await Query.executeWithParams(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
}

module.exports = User_activity;
