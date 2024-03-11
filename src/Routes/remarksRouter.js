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

const remarks_controller = require("../Controller/remarks_controller");
const check_auth = require("../Middleware/check_auth");

router.post("/create_remakrs",check_auth,remarks_controller.Create_Remarks)

router.post(
  "/get_remarks_by_pagination",
  check_auth,
  remarks_controller.Filter_Remarks
);

module.exports = router;
