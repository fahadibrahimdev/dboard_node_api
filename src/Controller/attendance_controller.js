const Attendance = require("../Models/Attendance");
const { success, error } = require("../Response/API-Response.js");
const moment = require("moment");

const { FcmTokenForPushNotification } = require("../Utils.js/CommonUtils.js");

exports.User_Attendance = (req, res) => {
  console.log("Attendance");

  if (!!req.userData.UserID == false) {
    return res.status(401).json(error("User ID (Auth) can't null", {}));
  } else {
    var params = {
      UserID: req.userData.UserID,
    };

    Attendance.GetAllUserAttendances(params, (err, data) => {
      if (!err) {
        return res
          .status(200)
          .json(success("User  Attendances Data By UserID :", data));
      } else {
        return res.status(400).json(error("ERROR :", { err }));
      }
    });
  }
};

exports.Team_Attendance = (req, res) => {
  console.log("Attendance");

  if (!!req.body.team_id == false) {
    return res.status(400).json(error("teamId is mandatory", {}));
  } else {
    var params = {
      teamId: req.body.team_id,
    };

    Attendance.GetAllUserAttendancesByTeamId(params, (err, data) => {
      if (!err) {
        return res
          .status(200)
          .json(success("User  Attendances Data By teamId  :", data));
      } else {
        return res.status(400).json(error("ERROR :", { err }));
      }
    });
  }
};

exports.User_Leave = (req, res) => {
  console.log("Leave");

  if (!!req.userData.UserID == false) {
    return res.status(400).json(error("UserID is mandatory", {}));
  } else {
    var params = {
      UserID: req.userData.UserID,
    };

    Attendance.GetAllUserLeave(params, (err, data) => {
      if (!err) {
        return res
          .status(200)
          .json(success("User Leave Data By UserID :", data));
      } else {
        return res.status(400).json(error("ERROR :", { err }));
      }
    });
  }
};

exports.Team_Leave = (req, res) => {
  console.log("Leave");

  if (!!req.body.teamId == false) {
    return res.status(400).json(error("teamId is mandatory", {}));
  } else {
    var params = {
      teamId: req.body.teamId,
    };

    Attendance.GetAllUserLeaveByTeamID(params, (err, data) => {
      if (!err) {
        return res.status(200).json(success("User leave :", data));
      } else {
        return res.status(400).json(error("ERROR :", { err }));
      }
    });
  }
};

exports.Create_Attendance = (req, res) => {
  console.log("CreateAttendance");

  if (
    !!req.userData.UserID == false ||
    !!req.body.teamId == false ||
    !!req.body.start_time == false ||
    !!req.body.shift_id == false
  ) {
    return res
      .status(400)
      .json(error("teamId, start_time, shift_id are mandatory", {}));
  } else {
    var params = {
      UserID: req.userData.UserID,
      teamId: req.body.teamId,
      shift_id: req.body.shift_id,
      end_time: !!req.body.end_time ? req.body.end_time : null,
      start_time: req.body.start_time,
    };

    Attendance.CreateAttendance(params, (err, _data) => {
      if (!err) {
        res.status(202).json(success("Attendance Data", { attendance: _data }));
      } else {
        res.status(400).json(error("fail", "attendance not created !", err));
      }
    });
  }
};

exports.Edit_Attendance_Status = (req, res) => {
  if (!!req.body.attendance_id == false) {
    return res.status(400).json(error("attendance_id is mandatory", {}));
  } else {
    const approve = /true/i.test(req.body.approve);
    const deny = /true/i.test(req.body.deny);

    if (
      (!!approve === true && !!deny === true) ||
      (!!approve === false && !!deny === false && !!req.body.end_time === false)
    ) {
      res.status(400).json(error("Invalid Data Provided!", {}));
    } else if (!!req.body.end_time && !!approve === false && !!deny === false) {
      Attendance.EditAttendance(
        req.body.end_time,
        req.body.attendance_id,
        null,
        (err, data) => {
          if (err) {
            return res.status(200).json(error("end_time not set!!", {}));
          } else {
            return res.status(200).json(success(" Updated time", data));
          }
        }
      );
    } else if (!!req.body.end_time === false) {
      Attendance.EditAttendance(
        null,
        req.body.attendance_id,
        !!approve ? 2 : 3,
        (err, data) => {
          if (err) {
            return res.status(200).json(error("end_time not set!!", {}));
          } else {
            if (approve == true) {
              params = {
                // Access first item and handle potential absence
                UserID: req.userData.UserID,
                notificationPayload: {
                  image:
                    "https://banner2.cleanpng.com/20201008/rtv/transparent-google-suite-icon-google-icon-5f7f985ccd60e3.5687494416021975968412.jpg",
                  title: "Your attendences approved!",
                  body: "Important update available.",
                },
              };
              FcmTokenForPushNotification(params);
            } else if (deny == true) {
              params = {
                // Access first item and handle potential absence
                UserID: req.userData.UserID,
                notificationPayload: {
                  image:
                    "https://banner2.cleanpng.com/20201008/rtv/transparent-google-suite-icon-google-icon-5f7f985ccd60e3.5687494416021975968412.jpg",
                  title: "Your attendences deny!",
                  body: "Important update available.",
                },
              };
              FcmTokenForPushNotification(params);
            }
            return res.status(200).json(success(" Updated0", { data }));
          }
        }
      );
    } else if (!!req.body.end_time) {
      Attendance.EditAttendance(
        req.body.end_time,
        req.body.attendance_id,
        !!approve ? 2 : 3,
        (err, data) => {
          if (err) {
            return res.status(200).json(error("end_time not set!!", {}));
          } else {
            if (approve == true) {
              params = {
                // Access first item and handle potential absence
                UserID: req.userData.UserID,
                notificationPayload: {
                  image:
                    "https://banner2.cleanpng.com/20201008/rtv/transparent-google-suite-icon-google-icon-5f7f985ccd60e3.5687494416021975968412.jpg",
                  title: "Your attendences approved!",
                  body: "Important update available.",
                },
              };
              FcmTokenForPushNotification(params);
            } else if (deny == true) {
              params = {
                // Access first item and handle potential absence
                UserID: req.userData.UserID,
                notificationPayload: {
                  image:
                    "https://banner2.cleanpng.com/20201008/rtv/transparent-google-suite-icon-google-icon-5f7f985ccd60e3.5687494416021975968412.jpg",
                  title: "Your attendences deny!",
                  body: "Important update available.",
                },
              };
              FcmTokenForPushNotification(params);
            }
            return res.status(200).json(success(" Updated1", { data }));
          }
        }
      );
    } else {
      res.status(400).json(error("Invalid Data Provided!", {}));
    }
  }
};

exports.Delete_Attendance_By_Attendances_ID = (req, res) => {
  if (!!req.body.attendance_id == false) {
    return res.status(400).json(error("attendance_id  is mandatory", {}));
  } else {
    var params = {
      attendanceID: req.body.attendance_id,
    };

    Attendance.DeleteAttendance(params, (err, data) => {
      if (data.affectedRows == 0) {
        return res.status(404).json(error("Neither ROw Deleted !", {}));
      }
      if (!err) {
        return res
          .status(202)
          .json(error("Attendance  For This  ID Deleted", data));
      } else {
        return res.status(411).json(error("Error", { err }));
      }
    });
  }
};

exports.Filter_Attendance = (req, res) => {
  console.log("Attendance");

  var params = {
    limit: parseInt(!!req.body.limit ? req.body.limit : 10),
    page: parseInt(!!req.body.page ? req.body.page : 1),
    sortBy: !!req.body.sortBy ? req.body.sortBy : "id",
    sortDirection: !!req.body.sort_direction ? req.body.sort_direction : "ASC",
    user_id: req.body.user_id,
    team_id: req.body.team_id,
    shift_id: req.body.shift_id,
    start_day: req.body.start_day,
    end_day: req.body.end_day,
    data_type: req.body.data_type,
    status: req.body.status,
  };

  Attendance.FilterAttendances(params, (err, data) => {
    if (!err) {
      return res
        .status(200)
        .json(success(" Attendance Data !  :", { ...data }));
    } else {
      return res.status(400).json(error("ERROR :", { err }));
    }
  });
};

exports.User_Working_Time = (req, res) => {
  if (
    !!req.body.user_id == false &&
    !!req.body.team_id == false &&
    !!req.body.shift_id == false
  ) {
    return res
      .status(400)
      .json(error("user_id,team_id,shift_id One of them  is mandatory", {}));
  } else {
    var params = {
      user_id: req.body.user_id,
      shift_id: req.body.shift_id,
      team_id: req.body.team_id,
      status: req.body.status,
    };

    if (!!req.body.start_date || !!req.body.end_date) {
      params.start_date = !!req.body.start_date
        ? req.body.start_date
        : "2023-11-01";
      params.end_date = !!req.body.end_date
        ? req.body.end_date
        : new Date().toISOString();
    }

    Attendance.UserWorkingTime(params, (err, data2) => {
      // if (data.affectedRows == 0) {
      //   return res.status(404).json(error("No record found !", {}));
      // }
      if (!err) {
        return res
          .status(202)
          .json(success("total time spend by this user", data2));
      } else {
        return res.status(411).json(error("Error", { err }));
      }
    });
  }
};

exports.Apply_Leave = (req, res) => {
  console.log("Apply_Attendance");

  if (
    !!req.userData.UserID == false ||
    !!req.body.team_id == false ||
    !!req.body.applied_leave_date == false ||
    !!req.body.shift_id == false
  ) {
    return res
      .status(400)
      .json(error("team_id,shift_id,applied_leave_date are mandatory"));
  } else {
    var params = {
      UserID: req.userData.UserID,
      teamId: req.body.team_id,
      shift_id: req.body.shift_id,
      start_time1: moment().format("YYYY-MM-DD HH:mm:ss"),
      start_time: req.body.applied_leave_date,
    };

    Attendance.ApplyAttendance(params, (err, _data) => {
      if (!err) {
        res.status(202).json(success(" Leave Data", { Leave: _data }));
      } else {
        res.status(400).json(error("fail", "Leave not created !", err));
      }
    });
  }
};

exports.Edit_Leave_Status = (req, res) => {
  const { leave_id, approve, deny } = req.body;
  const { UserID } = req.userData;
  approved_time = moment().format("YYYY-MM-DD HH:mm:ss");

  if (!leave_id) {
    return res.status(400).json(error("leave_id is mandatory", {}));
  }

  const isApprove = /true/i.test(approve);
  const isDeny = /true/i.test(deny);

  if ((isApprove && isDeny) || (!isApprove && !isDeny && !end_time)) {
    return res.status(400).json(error("Invalid Data Provided!", {}));
  }

  const statusToUpdate = !isApprove && !isDeny ? null : isApprove ? 2 : 3;

  Attendance.EditLeaveStatus(
    UserID,
    leave_id,
    statusToUpdate,
    approved_time,
    (err, data) => {
      if (err) {
        return res.status(200).json(error("Not set!!", {}));
      } else {
        return res.status(200).json(success("Updated", { data }));
      }
    }
  );
};
