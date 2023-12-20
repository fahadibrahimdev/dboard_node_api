const express = require("express");
const router = express.Router();
var multer = require("multer");
var path = require("path");

var storage = multer.diskStorage({
  destination: "./uploads/",
  filename: function (req, file, cb) {
    cb(null, "file_" + Date.now() + "_" + path.extname(file.originalname));
  },
});

const upload = multer({ storage: storage });

const attendance_controller = require("../Controller/attendance_controller");
const check_auth = require("../Middleware/check_auth");

router.get("/user_id", check_auth, attendance_controller.User_Attendance);
router.post("/team_id", check_auth, attendance_controller.Team_Attendance);
router.get("/user_leave", check_auth, attendance_controller.User_Leave);
router.post("/team_leave", check_auth, attendance_controller.Team_Leave);
router.post(
  "/create_attendance",
  check_auth,
  attendance_controller.Create_Attendance
);
router.patch(
  "/edit_attendance_status",
  check_auth,
  attendance_controller.Edit_Attendance_Status
);
router.delete(
  "/delete_attendance",
  check_auth,
  attendance_controller.Delete_Attendance_By_Attendances_ID
);

router.post(
  "/get_attendance_by_pagination",
  check_auth,
  attendance_controller.Filter_Attendance
);

router.post(
  "/get_user_working_time",
  check_auth,
  attendance_controller.User_Working_Time
);
router.post(
  "/apply_leave",
  check_auth,
  attendance_controller.Apply_Leave
);
router.patch(
  "/edit_attendance_status",
  check_auth,
  attendance_controller.Edit_Attendance_Status
);
router.patch(
  "/edit_leave_status",
  check_auth,
  attendance_controller.Edit_Leave_Status
);

module.exports = router;
