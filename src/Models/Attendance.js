const { verify } = require("jsonwebtoken");
const sql = require("../Config/MYSQL_Configuration");
const Query = require("../Helpers/queryHelper");

class Attendance {
  constructor(Attendance) {
    this.id = Attendance.id;
    this.start_time = Attendance.start_time;
    this.end_time = Attendance.Codend_timee;
    this.user_id = Attendance.user_id;
    this.is_active = Attendance.is_active;
    this.leave = Attendance.leave;
    this.shift_id = Attendance.shift_id;
    this.team_id = Attendance.teams_id;
  }

  static FindUserId(user_id, result) {
    console.log("FindUserByid");
    var myQuery = `SELECT id FROM users WHERE id = ?  `;
    var myParam = [user_id];
    sql.query(myQuery, myParam, (err, res) => {
      if (res) {
        result(null, res);
      } else result(err, null);
    });
  }

  static async GetAllUserAttendances(body, result) {
    try {
      var myQuery =
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
        "FROM user_attendances " +
        "LEFT JOIN lookups AS shifts ON user_attendances.shift_id = shifts.id " +
        "LEFT JOIN lookups AS teams ON user_attendances.team_id = teams.id " +
        "LEFT JOIN users AS u ON user_attendances.user_id = u.id " +
        "LEFT JOIN users AS ua ON user_attendances.created_by = ua.id " +
        "LEFT JOIN users AS uau ON user_attendances.deleted_by = uau.id " +
        "LEFT JOIN users AS uaau ON user_attendances.approved_by = uaau.id " +
        "LEFT JOIN users AS uaaau ON user_attendances.modify_by = uaaau.id " +
        "WHERE user_attendances.user_id = " +
        body.UserID +
        ";";

      const res = await Query.execute(myQuery);
      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
  static async GetAllUserAttendancesByTeamId(body, result) {
    try {
      console.log("GetAllUserAttendance");
      var myQuery =
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
        "FROM user_attendances " +
        "LEFT JOIN lookups AS shifts ON user_attendances.shift_id = shifts.id " +
        "LEFT JOIN lookups AS teams ON user_attendances.team_id = teams.id " +
        "LEFT JOIN users AS u ON user_attendances.user_id = u.id " +
        "LEFT JOIN users AS ua ON user_attendances.created_by = ua.id " +
        "LEFT JOIN users AS uau ON user_attendances.deleted_by = uau.id " +
        "LEFT JOIN users AS uaau ON user_attendances.approved_by = uaau.id " +
        "LEFT JOIN users AS uaaau ON user_attendances.modify_by = uaaau.id " +
        "WHERE user_attendances.team_id  IN (" +
        body.teamId +
        " )AND leaves=0";

      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async GetAllUserLeave(body, result) {
    try {
      console.log("GetAllUserLeave");
      var myQuery =
        "SELECT * FROM user_attendances WHERE user_id =" +
        body.UserID +
        " AND leaves=1";
      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async GetAllUserLeaveByTeamID(body, result) {
    try {
      console.log("GetAllUserLeave");
      var myQuery =
        "SELECT * FROM user_attendances WHERE team_id =" +
        body.teamId +
        " AND leaves=1";
      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async CreateAttendance(body, result) {
    try {
      console.log("CreateAttendance");

      var myQuery =
        "INSERT INTO user_attendances SET id=NULL," +
        "start_time='" +
        body.start_time +
        "',is_active=1," +
        "user_id=" +
        body.UserID +
        "," +
        "status=1,leaves=0,comments='Testing 123'," +
        "shift_id=" +
        body.shift_id +
        "," +
        "team_id=" +
        body.teamId +
        "," +
        "created_time='" +
        new Date().toISOString() +
        "'," +
        "created_by=" +
        body.UserID;

      if (!!body.end_time) {
        myQuery = myQuery + ",end_time ='" + body.end_time + "';";
      }

      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async EditAttendance(end_time, attendance_id, status, result) {
    try {
      console.log("updateStatusAttendance");
      var myQuery = `UPDATE user_attendances SET `;
      if (!!end_time) {
        myQuery = myQuery + "end_time ='" + end_time + "',";
      }

      if (!!status) {
        myQuery = myQuery + "status = " + status + ",";
      }

      myQuery = myQuery.slice(0, -1);

      myQuery = myQuery + " WHERE user_attendances.id = " + attendance_id;
      const res = await Query.execute(myQuery);
      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async DeleteAttendance(body, result) {
    try {
      console.log("updateStatusAttendance");
      var myQuery =
        `DELETE FROM user_attendances WHERE id=` + body.attendanceID;
      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async FilterAttendances(body, result) {
    try {
      console.log("FilterAttendances");
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
          myWhereQuery + "user_attendances.user_id IN (" + body.user_id + ")AND ";
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

      var mySortQuery = "";

      if (!!body.sortBy) {
        mySortQuery = mySortQuery + " ORDER BY " + body.sortBy;
      }
      if (!!body.sortDirection) {
        mySortQuery = mySortQuery + " " + body.sortDirection;
      }

      if (!!body.limit) {
        mySortQuery = mySortQuery + " LIMIT " + body.limit;
      }
      if (!!body.page) {
        const offset = (body.page - 1) * body.limit;
        mySortQuery = mySortQuery + " OFFSET " + offset;
      }

      var myDataCompleteQuery =
        myBaseDataQuery + myJoinQuery + myWhereQuery + mySortQuery;
      var myTotalCompleteQuery = myBaseTotalQuery + myWhereQuery;

      
      const myData = await Query.execute(myDataCompleteQuery);

      
      const myTotalData = await Query.execute(myTotalCompleteQuery);

      const totalPage = Math.ceil(myTotalData[0].count / body.limit);
      const totalRecord = myTotalData[0].count;

      const res = {
        attendances: myData,
        pagination: {
          totalRecord,
          totalPages: totalPage,
          limit: body.limit,
          currentPage: body.page,
        },
      };

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
  static async UserWorkingTime(params, result) {
    try {
      console.log("UserWorkingTime");
      var myQuery =
        "SELECT user_id,start_time,end_time,TIME_FORMAT(SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(end_time, start_time)))), '%H:%i:%s') AS total_time_spent" +
        " FROM user_attendances ";
      var myWhereQuery =
        "WHERE end_time IS NOT NULL AND  ";
    if(!!params.shift_id){
      myWhereQuery =
      myWhereQuery +
      " shift_id  IN("   + params.shift_id +
      ") AND ";
    }
    if(!!params.user_id){
      myWhereQuery =
      myWhereQuery +
      " user_id  IN("   + params.user_id +
      ") AND ";
    }
    if(!!params.team_id){
      myWhereQuery =
      myWhereQuery +
      " team_id IN("   + params.team_id +
      ") AND ";
    }

      if (!!params.start_date && !!params.end_date) {
        myWhereQuery =
          myWhereQuery +
          " start_time >= CONCAT('" +
          params.start_date +
          "', ' 00:00:00')" +
          " AND ";

        myWhereQuery =
          myWhereQuery +
          "end_time <= CONCAT('" +
          params.end_date +
          "', ' 23:59:59')" +
          " AND ";
      }

      var lastFour =
        myWhereQuery.length > 4
          ? myWhereQuery.substr(myWhereQuery.length - 4)
          : "";

      if (lastFour === "AND ") {
        myWhereQuery = myWhereQuery.slice(0, -4);
      }
      var myTotalCompleteQuery = myQuery + myWhereQuery 

      const res = await Query.execute(myTotalCompleteQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
  static async ApplyAttendance(body, result) {
    try {
      console.log("ApplyAttendance");

      var myQuery =
        "INSERT INTO user_attendances SET " +
        "start_time='" +
        body.start_time +
        "',is_active=1," +
        "user_id=" +
        body.UserID +
        "," +
        "status=1,leaves=1," +
        " created_by =" +
        body.UserID +
        ", created_time='" +
        body.start_time1 +
        "',shift_id=" +
        body.shift_id +
        "," +
        "team_id=" +
        body.teamId +
        ";";

      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
  static async EditLeaveStatus(
    UserID,
    leave_id,
    status,
    approved_time,
    result
  ) {
    try {
      console.log("EditLeaveStatus");
      var myQuery = `UPDATE user_attendances SET `;

      if (status == 3) {
        if (!!UserID) {
          myQuery = myQuery + "deny_by ='" + UserID + "',";
        }

        if (!!status) {
          myQuery = myQuery + "status = " + status + ",";
        }

        if (!!approved_time) {
          myQuery = myQuery + "deny_time = '" + approved_time + "',";
        }
      }
      if (status == 2) {
        if (!!UserID) {
          myQuery = myQuery + "approved_by ='" + UserID + "',";
        }

        if (!!status) {
          myQuery = myQuery + "status = " + status + ",";
        }

        if (!!approved_time) {
          myQuery = myQuery + "approved_time = '" + approved_time + "',";
        }
      }

      // myQuery = myQuery + " approved_time = '"+ approved_time + "',";
      myQuery = myQuery.slice(0, -1);
      myQuery = myQuery + " WHERE user_attendances.id = " + leave_id;
      const res = await Query.execute(myQuery);
      result(null, res);
    } catch (e) {
      result(e, null);
    }
    // console.log("updateStatusAttendance");
    // var myQuery = `UPDATE user_attendances SET `;
    // if (!!end_time) {
    //   myQuery = myQuery + "end_time ='" + end_time + "',";
    // }

    // if (!!status) {
    //   myQuery = myQuery + "status = " + status + ",";
    // }

    // myQuery = myQuery.slice(0, -1);

    // myQuery = myQuery + " WHERE user_attendances.id = " + attendanceID;

    // sql.query(myQuery, (err, res) => {
    //   if (res) {
    //     result(null, res);
    //   } else result(err, null);
    // });
  }
}

module.exports = Attendance;
