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

const transaction_controller = require("../Controller/transaction_controller");
const check_auth = require("../Middleware/check_auth");

router.get(
  "/get_transaction",
  check_auth,
  transaction_controller.User_transaction
);
router.get(
  "/transaction_by_team_id",
  check_auth,
  transaction_controller.Transaction_by_team_id
);
router.put(
  "/creat_transaction",
  check_auth,
  transaction_controller.Creat_transaction
);
router.delete(
  "/deleted_transaction",
  check_auth,
  transaction_controller.Delete_transaction
);
router.patch(
  "/approved_transaction",
  check_auth,
  transaction_controller.Approved_transaction
);
router.patch(
  "/edit_transaction",
  check_auth,
  transaction_controller.Edit_transaction
);

router.post(
  "/get_transactions_by_pagination",
  check_auth,
  transaction_controller.Filter_transaction
);

module.exports = router;
