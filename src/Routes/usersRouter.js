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

const user_controller = require("../Controller/user_controller");
const check_auth = require("../Middleware/check_auth");

router.post("/login", user_controller.Login_User);
router.post("/loginV2", user_controller.Login_UserV2);
router.post("/signup", user_controller.Signup_User);
router.post("/heartbeat", check_auth, user_controller.Heart_Beat);
router.post(
  "/update_profile",
  upload.single("image"),
  check_auth,
  user_controller.Update_Profile
);
router.post("/change_password", check_auth, user_controller.Chnage_Password);
router.post("/logout", user_controller.Logout);
router.delete("/delete_user", user_controller.Delete_User);
router.post("/update_news_flags",check_auth,user_controller.Update_Flags);
router.post("/get_users_by_team_id",check_auth,user_controller.Get_Users_By_Teams_Id);
router.post("/export_user_data",user_controller.Export_User_Data)
module.exports = router;
