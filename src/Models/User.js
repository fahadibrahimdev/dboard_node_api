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
  static async LastLoginFCMToken(params, result) {
    try {
      console.log("LastLoginFCMToken");

      // var myQuery = "SELECT * FROM user_activity WHERE user_id ="+ body.userID +"ORDER BY last_login_time DESC LIMIT 1 ;";
      var myQuery = "SELECT device_token FROM user_activity WHERE user_id =1 ORDER BY last_login_time DESC LIMIT 1 ;";
      
      const res = await Query.executeWithParams(myQuery, params);

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

  static async Get_Users_Data_Excel(body,result) {
    try {
      console.log("Get_Users_Data_Excel");
      var myBaseDataQuery =
        "SELECT " +
        "shifts.code AS shift_name, " +
        "teams.code AS teams_name, " +
        "u.user_name AS user_name, " +
        "u.full_name AS full_name, " +
        "user_attendances.shift_id, " +
        "user_attendances.team_id, " +
        "user_attendances.user_id, " +
        "user_attendances.id, " +
        "user_attendances.start_time, " +
        "user_attendances.end_time, " +
        "user_attendances.status, " +
        "user_attendances.leaves, " +
        "user_attendances.comments, " +
        "user_attendances.created_by, " +
        "ua.full_name AS created_name, " +
        "user_attendances.deleted_by, " +
        "uau.full_name AS deleted_name, " +
        "user_attendances.approved_by, " +
        "uaau.full_name AS approved_name, " +
        "user_attendances.modify_by, " +
        "uaaau.full_name AS modify_name, " +
        "user_attendances.created_time, " +
        "user_attendances.deleted_time, " +
        "user_attendances.approved_time, " +
        "user_attendances.modify_time " +
        "FROM user_attendances ";

      var myBaseTotalQuery = "SELECT COUNT(*) AS count FROM user_attendances ";
      var myJoinQuery =
        "LEFT JOIN lookups AS shifts ON user_attendances.shift_id = shifts.id " +
        "LEFT JOIN lookups AS teams ON user_attendances.team_id = teams.id " +
        "LEFT JOIN users AS u ON user_attendances.user_id = u.id " +
        "LEFT JOIN users AS ua ON user_attendances.created_by = ua.id " +
        "LEFT JOIN users AS uau ON user_attendances.deleted_by = uau.id " +
        "LEFT JOIN users AS uaau ON user_attendances.approved_by = uaau.id " +
        "LEFT JOIN users AS uaaau ON user_attendances.modify_by = uaaau.id ";
      var myWhereQuery = "";

      if (!!body.user_id) {
        myWhereQuery =
          myWhereQuery +
          "user_attendances.user_id IN (" +
          body.user_id +
          ")AND ";
      }
      if (!!body.status) {
        myWhereQuery =
          myWhereQuery + "user_attendances.status IN (" + body.status + ")AND ";
      }
      if (!!body.team_id) {
        myWhereQuery =
          myWhereQuery +
          " user_attendances.team_id IN (" +
          body.team_id +
          ") AND ";
      }
      if (!!body.shift_id) {
        myWhereQuery =
          myWhereQuery +
          "user_attendances.shift_id = " +
          body.shift_id +
          " AND ";
      }
      if (!!body.lead_user_id) {
        myWhereQuery =
          myWhereQuery +
          "transaction.lead_user_id = " +
          body.lead_user_id +
          " AND ";
      }

      if (!!body.is_active) {
        myWhereQuery =
          myWhereQuery +
          "user_attendances.is_active = " +
          body.is_active +
          " AND ";
      }
      if (!!body.start_day) {
        myWhereQuery =
          myWhereQuery +
          "user_attendances.start_time >= '" +
          body.start_day +
          "' AND ";
      }
      if (!!body.end_day) {
        myWhereQuery =
          myWhereQuery +
          "(user_attendances.end_time <= '" +
          body.end_day +
          "' OR user_attendances.end_time IS NULL ) AND ";
      }
      if (body.data_type == "attendance") {
        myWhereQuery = myWhereQuery + "user_attendances.leaves = 0" + " AND ";
      }
      if (body.data_type == "leave") {
        myWhereQuery = myWhereQuery + "user_attendances.leaves = 1" + " AND ";
      }

      var lastFour =
        myWhereQuery.length > 4
          ? myWhereQuery.substr(myWhereQuery.length - 4)
          : "";

      if (lastFour === "AND ") {
        myWhereQuery = "WHERE " + myWhereQuery.slice(0, -4);
      }

      // var mySortQuery = "";

      // if (!!body.sortBy) {
      //   mySortQuery = mySortQuery + " ORDER BY " + body.sortBy;
      // }
      // if (!!body.sortDirection) {
      //   mySortQuery = mySortQuery + " " + body.sortDirection;
      // }

      // if (!!body.limit) {
      //   mySortQuery = mySortQuery + " LIMIT " + body.limit;
      // }
      // if (!!body.page) {
      //   const offset = (body.page - 1) * body.limit;
      //   mySortQuery = mySortQuery + " OFFSET " + offset;
      // }

      var myDataCompleteQuery =
        // myBaseDataQuery + myJoinQuery + myWhereQuery + mySortQuery;
        myBaseDataQuery + myJoinQuery + myWhereQuery ;
      var myTotalCompleteQuery = myBaseTotalQuery + myWhereQuery;

      const myData = await Query.execute(myDataCompleteQuery);

      // const myTotalData = await Query.execute(myTotalCompleteQuery);

      // const totalPage = Math.ceil(myTotalData[0].count / body.limit);
      // const totalRecord = myTotalData[0].count;

      const res = {
        attendances: myData,
        // pagination: {
        //   totalRecord,
        //   totalPages: totalPage,
        //   limit: body.limit,
        //   currentPage: body.page,
        // },
      };

      result(null, res);
  
    } catch (e) {
      result(e, null);
    }
  }
}

console.log("User Model");

module.exports = User;
