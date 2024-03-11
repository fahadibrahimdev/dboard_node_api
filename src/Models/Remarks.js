const { verify } = require("jsonwebtoken");
const sql = require("../Config/MYSQL_Configuration");
const Query = require("../Helpers/queryHelper");

class Remarks {
  constructor(Remarks) {
    this.id = Remarks.id;
    this.created_time = Remarks.created_time;
    this.user_id = Remarks.user_id;
    this.attendance_id = Remarks.attendance_id;
  }

  static async FilterRemarks(body, result) {
    try {
      console.log("FilterRemarks");
      var myBaseDataQuery =
        "SELECT " +
        "remarks.id, " +
        "remarks.user_id, " +
        "u.full_name AS Full_name, " +
        "remarks.attendance_id," +
        "remarks.comments, " +
        "remarks.created_time " +
        "FROM remarks ";

      var myBaseTotalQuery = "SELECT COUNT(*) AS count FROM remarks ";
      var myJoinQuery = "LEFT JOIN users AS u ON remarks.user_id = u.id ";
      var myWhereQuery = "";

      if (!!body.user_id) {
        myWhereQuery =
          myWhereQuery + "remarks.user_id = " + body.user_id + " AND ";
      }
      if (!!body.attendance_id) {
        myWhereQuery =
          myWhereQuery +
          "remarks.attendance_id = " +
          body.attendance_id +
          " AND ";
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

      const res = {
        commentsData: myData,
        pagination: {
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

      // var myBaseTotalQuery = "SELECT COUNT(*) AS count FROM user_attendances ";
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
          myWhereQuery + "user_attendances.user_id = " + body.user_id + " AND ";
      }
      if (!!body.attendance_id) {
        myWhereQuery =
          myWhereQuery +
          "user_attendances.id = " +
          body.attendance_id +
          " AND ";
      }

      var lastFour =
        myWhereQuery.length > 4
          ? myWhereQuery.substr(myWhereQuery.length - 4)
          : "";

      if (lastFour === "AND ") {
        myWhereQuery = "WHERE " + myWhereQuery.slice(0, -4);
      }

      var myDataCompleteQuery = myBaseDataQuery + myJoinQuery + myWhereQuery;
      // var myTotalCompleteQuery = myBaseTotalQuery + myWhereQuery;

      const myData = await Query.execute(myDataCompleteQuery);
      // const myTotalData = await Query.execute(myTotalCompleteQuery);

      // const totalPage = Math.ceil(myTotalData[0].count / body.limit);

      const res = myData.length > 0 ? myData[0] : null;

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async Create_Remarks(body, result) {
    try {
      console.log("Create_Remarks");

      var myQuery =
        "INSERT INTO `remarks` (`id`,`user_id`,`attendance_id`,`comments`,`created_time`) " +
        "VALUE ( '" +"NULL', '" +
        body.user_id +
        "','" +
        body.attendance_id +
        "','" +
        body.comments +
        "','" +
        body.created_time +
        "');";
      const res = await Query.executeWithParams(myQuery);

   
      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }
}

module.exports = Remarks;
