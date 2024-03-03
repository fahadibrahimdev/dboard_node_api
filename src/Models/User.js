const { verify } = require("jsonwebtoken");
const sql = require("../Config/MYSQL_Configuration");
const { param } = require("../Routes/transactionRouter");
const Query = require("../Helpers/queryHelper");
class User {
  constructor(User) {
    this.id = User.id;
    this.full_name = User.full_name;
    this.user_name = User.user_name;
    this.email = User.email;
    this.dob = User.dob;
    this.mobile = User.mobile;
    this.password = User.password;
    this.device_token = User.device_token;
    this.platform = User.platform;
    this.is_super_user = User.is_super_user;
    this.image = User.image;
    this.role = User.role;
    this.new_user_req = User.new_user_req;
  }
  static GetAllUsers(result) {
    console.log("GetAllUsers");

    var myQuery = `SELECT * FROM users`;

    sql.query(myQuery, (err, res) => {
      if (res) {
        result(null, res);
      } else result(err, null);
    });
  }

  static async FindCurrentRegisteredUser(body, result) {
    try {
      console.log("FindCurrentRegisteredUser");
      var myQuery =
        "SELECT * FROM users WHERE user_name ='" +
        body.UserName +
        "' AND password = '" +
        body.Password +
        "'" +
        " AND deleted_by IS NULL";
      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async FindCurrentRegisteredUserV2(body, result) {
    try {
      console.log("FindCurrentRegisteredUser");
      var myQuery =
        "SELECT * FROM users WHERE user_name ='" +
        body.UserName +
        "' AND password = '" +
        body.Password +
        "'";
      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async FindUserByid(body, result) {
    try {
      console.log("FindUserByid");
      var myQuery =
        "SELECT * FROM users WHERE deleted_by IS NULL AND  id =  " +
        body.UserID;
      const myData = await Query.execute(myQuery);
      const res = {
        data: myData,
      };

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static FindUserid(user_id, result) {
    console.log("FindUserByid");
    var myQuery = `SELECT id FROM users WHERE id = ?  `;
    var myParam = [user_id];
    sql.query(myQuery, myParam, (err, res) => {
      if (res) {
        result(null, res);
      } else result(err, null);
    });
  }

  static async UpdateTokenInfo(params, result) {
    try {
      console.log("Update Tokens");

      var myQuery = `UPDATE users SET device_token = ?, platform= ? WHERE id = ? `;
      var myParam = [params.DeviceToken, params.Platform, params.UserID];
      const res = await Query.executeWithParams(myQuery, myParam);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static FindCurrentRegisteredUserByUserName(UserName, result) {
    console.log("FindCurrentRegisteredUser");
    sql.query(
      `SELECT * FROM users WHERE user_name = ? `,
      [UserName],
      (err, res) => {
        if (res) {
          result(null, res);
        } else result(err, null);
      }
    );
  }

  static Register(newUser, result) {
    console.log("Register");
    sql.query(`INSERT INTO users SET ?`, newUser, (err, res) => {
      if (res) {
        result(null, res);
      } else {
        result(err, null);
      }
    });
  }

  static UpdatePlatformAndDeviceToken(id, result) {
    console.log("Logout Query Called!");
    var myQuery = `UPDATE users SET device_token = NULL, platform = NULL WHERE id = ?`;
    var myParam = id;
    sql.query(myQuery, myParam, (err, res) => {
      if (res) {
        result(null, res);
      } else result(err, null);
    });
  }

  static async FindCurrentRegisteredUserBysocial_id(
    social_id,
    social_platform,
    result
  ) {
    console.log("login throught link");
    try {
      var myQuery = `SELECT * FROM social_info WHERE social_id =? AND social_platform=?`;
      var myParam = [social_id, social_platform];
      const myData = await Query.executeWithParams(myQuery, myParam);
      const res = {
        data: myData,
      };

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static IntersionInPermission(userID, result) {
    console.log("IntersionInPermission");
    var myQuery =
      "INSERT INTO user_permissions (id,user_id, permission_id, is_active)" +
      " VALUES" +
      "(NULL," +
      userID +
      ",7,1)," +
      "(NULL," +
      userID +
      ",2,1)";

    sql.query(myQuery, (err, res) => {
      if (res) {
        result(null, res);
      } else result(err, null);
    });
  }
  static async Update_Profile(body, result) {
    console.log("update image");
    try {
      var myQuery = "UPDATE users SET  ";

      if (!!body.user_name) {
        myQuery = myQuery + "user_name = '" + body.user_name + "',";
      }
      if (!!body.password) {
        myQuery = myQuery + "password = '" + body.password + "',";
      }
      if (!!body.image) {
        myQuery = myQuery + "image = '" + body.image.path + "',";
      }
      if (!!body.email) {
        myQuery = myQuery + "email = '" + body.email + "',";
      }
      if (!!body.mobile) {
        myQuery = myQuery + "mobile = '" + body.mobile + "',";
      }
      if (!!body.full_name) {
        myQuery = myQuery + "full_name = '" + body.full_name + "',";
      }

      myQuery = myQuery.slice(0, -1);
      myQuery = myQuery + "WHERE id =" + body.UserID;

      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async UserData(body, result) {
    try {
      console.log("GetUserData");
      var myQuery =
        "SELECT users.id, users.full_name, users.user_name, users.platform, users.email, users.mobile, users.dob, users.is_super_user, users.image, roles.id as role_id,  roles.name,roles.code FROM users JOIN roles ON users.role = roles.id WHERE users.id = " +
        body.UserID;
      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async FindCurrentPasswordUser(body, result) {
    try {
      console.log("FindCurrentPasswordUser");
      var myQuery =
        "SELECT * FROM users WHERE user_name ='" +
        body.UserName +
        "' AND password = '" +
        body.OldPassword +
        "'";
      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async UpdatePasswordInfo(params, result) {
    try {
      console.log("UpdatePasswordInfo");

      var myQuery = `UPDATE users SET password = ? WHERE user_name = ?`;
      var myParam = [params.NewPassword, params.UserName];
      const res = await Query.executeWithParams(myQuery, myParam);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
  static async Logout(body, result) {
    try {
      console.log("LOGOUT!!");

      var myQuery =
        "UPDATE `user_activity` SET `is_session_completed` = 1, `last_logout_time` ='" +
        body.Logout_time +
        "', `last_logout_platform` = '" +
        body.platform +
        "' where user_id =" +
        body.UserID +
        " AND is_session_completed = 0 AND last_login_platform = '" +
        body.platform +
        "';";
      const res = await Query.executeWithParams(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
  static FindUserid2(body, result) {
    console.log("FindUserByid");
    var myQuery = "SELECT id FROM users WHERE id = " + body.user_id;

    sql.query(myQuery, (err, res) => {
      if (res) {
        result(null, res);
      } else result(err, null);
    });
  }

  static async DeletedUser(params, result) {
    try {
      console.log("DeletedUser");

      var myQuery = `UPDATE users SET deleted_by	 = ? , deleted_time = ? WHERE user_name = ? AND password = ?`;
      var myParam = [
        params.Deleted_By,
        params.Deleted_Time,
        params.UserName,
        params.Password,
      ];
      const res = await Query.executeWithParams(myQuery, myParam);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
  static async Get_Users_By_Teams_Id(body, result) {
    try {
      console.log("Get_Users_By_Teams_Id");

      var myQuery =
        "SELECT ul.user_id, u.user_name, u.full_name, ul.lookup_id AS team_id, l.code AS team_code FROM user_lookups ul JOIN users u ON ul.user_id = u.id JOIN lookups l ON ul.lookup_id = l.id  WHERE ul.lookup_id IN (" +
        body.team_id +
        ") ;";

      const res = await Query.executeWithParams(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
}

console.log("User Model");

module.exports = User;
