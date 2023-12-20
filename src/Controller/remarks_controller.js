const Remarks = require("../Models/Remarks.js");
const { success, error } = require("../Response/API-Response.js");
const { promise } = require("bcrypt/promises.js");

exports.Filter_Remarks = (req, res) => {
  if (!!req.body.attendance_id == false) {
    return res.status(400).json(error("attendance_id not provided", {}));
  }
  console.log("Remarks");

  var params = {
    limit: parseInt(!!req.body.limit ? req.body.limit : 10),
    page: parseInt(!!req.body.page ? req.body.page : 1),
    sortBy: !!req.body.sortBy ? req.body.sortBy : "id",
    sortDirection: !!req.body.sortDirection ? req.body.sortDirection : "ASC",
    user_id: req.body.user_id,
    attendance_id: req.body.attendance_id,
  };
  let commentsData = {};
  let attendanceDetails = {};

  let firstPromise = () => {
    var params = {
      limit: parseInt(!!req.body.limit ? req.body.limit : 10),
      page: parseInt(!!req.body.page ? req.body.page : 1),
      sortBy: !!req.body.sortBy ? req.body.sortBy : "id",
      sortDirection: !!req.body.sortDirection ? req.body.sortDirection : "DESC",
      user_id: req.body.user_id,
      attendance_id: req.body.attendance_id,
    };
    return new Promise((resolve, reject) => {
      Remarks.FilterRemarks(params, (err, CommentsDataObj) => {
        if (err) {
          commentsData = {};
        } else {
          commentsData = CommentsDataObj;
        }
        resolve("Completed!");
      });
    });
  };

  let secondPromise = () => {
    return new Promise((resolve, reject) => {
      Remarks.FilterAttendances(params, (err, AttendanceData) => {
        if (!err) {
          attendanceDetails = AttendanceData;
        } else {
          attendanceDetails = {};
        }
        resolve("Completed!");
      });
    });
  };

  let promiseExecution = async () => {
    let promise = await Promise.all([firstPromise(), secondPromise()]);
    console.log(promise);

    res.status(200).json(
      success("Attendance/Remarks fatch DAta ", {
        attendanceDetails,
        ...commentsData,
      })
    );
  };

  // Function call
  promiseExecution();

  
};
