const { now } = require("moment");
const Remarks = require("../Models/Remarks.js");
const { success, error } = require("../Response/API-Response.js");
const Attendance = require("../Models/Attendance.js");
const { pushNotificationMulti } = require("../Utils.js/fireBase.js");

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

exports.Create_Remarks = (req, res) => {
  if (
    !!req.body.comments == false ||
    !!req.body.attendance_id == false ||
    !!req.userData.UserID == false
  ) {
    return res
      .status(400)
      .json(error("attendance_id/comments not provided", {}));
  } else {
    console.log("Remarks");
    const currentDate = new Date();
    const createdTime = currentDate.toISOString();
    var params = {
      comments: req.body.comments,
      user_id: req.userData.UserID,
      attendance_id: req.body.attendance_id,
      created_time: createdTime,
    };

    Remarks.Create_Remarks(params, (err) => {
      if (err) {
        return res
          .status(400)
          .json(
            error(
              "Error while creating remarks. No attendance found for this id",
              {}
            )
          );
      }
       else {
        Attendance.FetchUserDeviceToken(params, (err,queryData) => {
          if (err) {
            return res
              .status(400)
              .json(error("Error while fetching user device token", {}));
          } 
          else {
            const registrationToken = queryData.map((obj) => obj.device_token);

                const notificationPayload = {
                  image:
                    "https://banner2.cleanpng.com/20201008/rtv/transparent-google-suite-icon-google-icon-5f7f985ccd60e3.5687494416021975968412.jpg",
                  title: "Remarks",
                  body: "You got a new Comment!",
                };

                pushNotificationMulti(registrationToken, notificationPayload);
            return res
              .status(200)
              .json(success("Message Sent Successfully!", { }));
          }
        });
      }
    });
  }
};


