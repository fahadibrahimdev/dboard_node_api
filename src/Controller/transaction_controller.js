const Transaction = require("../Models/Transaction");
const { success, error } = require("../Response/API-Response.js");
const param = require("../Routes/transactionRouter");

exports.User_transaction = async (req, res) => {
  console.log("User_transaction");

  if (!!req.userData.user_id == false) {
    return res.status(401).json(error("User ID (Auth) can't null", {}));
  } 
  else {
    var params = {
      UserID: req.userData.UserID,
    };
    Transaction.GetTransaction(params, (err, data) => {
      if (data == "") {
        return res.status(404).json(success("User ID not Found :", {}));
      }

      if (!err) {
        return res.status(200).json(success("User  Transaction Data :", data));
      } else {
        return res.status(400).json(error("ERROR :", { err }));
      }
    });
  }
};

exports.Transaction_by_team_id = (req, res) => {
  console.log("Transaction_by_team_id");

  if (!!req.body.team_id == false) {
    return res.status(400).json(error("Team ID  mandatory", {}));
  } else {
    var params = {
      team_id: req.body.team_id,
    };
    Transaction.GetTransactionBYTeamID(params, (err, data) => {
      if (data == "") {
        return res.status(404).json(error("Teams ID not Found :", {}));
      }

      if (!err) {
        return res
          .status(200)
          .json(success("User  Transaction Data by Team ID :", data));
      } else {
        return res.status(400).json(error("ERROR :", { err }));
      }
    });
  }
};

exports.Creat_transaction = (req, res) => {
  console.log("Creat_transaction");

  if (
    !!req.userData.UserID == false ||
    !!req.body.team_id == false ||
    !!req.body.shift_id == false ||
    !!req.body.lead_user_id == false ||
    !!req.body.type == false ||
    !!req.body.game == false ||
    !!req.body.amount == false
  ) {
    return res
      .status(400)
      .json(
        error(
          "Team ID/shift_id /lead_user_id/type(cash)/game/created_by mandatory",
          {}
        )
      );
  } else {
    var params = {
      UserID: req.userData.UserID,
      team_id: req.body.team_id,
      shift_id: req.body.shift_id,
      lead_user_id: req.body.lead_user_id,
      type: parseInt(req.body.type),
      game: req.body.game,
      amount: req.body.amount,
      UserID: req.userData.UserID,
      is_active: !!req.body.is_active ? req.body.is_active : 1,
      created_time: new Date().toISOString(),
      platform: !!req.body.platform ? req.body.platform : null,
      fb_page: !!req.body.fb_page ? req.body.fb_page : null,
      backend: !!req.body.backend ? req.body.backend : null,
      client_info: !!req.body.client_info ? req.body.client_info : null,
    };
    Transaction.CreatTransaction(
      params,

      (err, data) => {
        if (!err) {
          return res.status(200).json(success("Transaction Created :", data));
        } else {
          return res.status(400).json(error("Transaction  Not Created :", {}));
        }
      }
    );
  }
};

exports.Delete_transaction = (req, res) => {
  console.log("Delete_transaction");

  if (!!req.body.transaction_id == false) {
    return res.status(400).json(error("Transaction ID  mandatory", {}));
  } else {
    var params = {
      UserID: req.userData.UserID,
      deleted_time: new Date().toISOString(),
      transaction_id: req.body.transaction_id,
    };
    Transaction.DeletedTransaction(params, (err, data) => {
      if (data.affectedRows == "0") {
        return res.status(404).json(error("Transaction ID not Found :", {}));
      }
      if (!err) {
        return res
          .status(200)
          .json(success("User  Transaction Data Deleted!  :", data));
      } else {
        return res.status(400).json(error("ERROR :", { err }));
      }
    });
  }
};

exports.Approved_transaction = (req, res) => {
  console.log("Approved_transaction");

  if (!!req.body.transaction_id == false) {
    return res.status(400).json(error("transaction_id  mandatory", {}));
  } else {
    var Time = new Date().toISOString();
    var params = {
      UserID: req.userData.UserID,
      Time: Time,
      transaction_id: req.body.transaction_id,
    };

    !!req.body.status
      ? Transaction.ApprovedTransaction(params, (err, data) => {
          if (data.affectedRows == "0") {
            return res
              .status(404)
              .json(error("Transaction ID not Found :", {}));
          }

          if (!err) {
            return res
              .status(200)
              .json(success("User  Transaction  Approved!  :", data));
          } else {
            return res.status(400).json(error("ERROR :", { err }));
          }
        })
      : Transaction.DeniedTransaction(
          params,

          (err, data) => {
            if (data.affectedRows == "0") {
              return res
                .status(404)
                .json(error("Transaction ID not Found :", {}));
            }

            if (!err) {
              return res
                .status(200)
                .json(success("User  Transaction Denied!  :", data));
            } else {
              return res.status(400).json(error("ERROR :", { err }));
            }
          }
        );
  }
};

exports.Edit_transaction = (req, res) => {
  console.log("Edit_transaction");

  if (!!req.body.transaction_id == false) {
    return res.status(400).json(error("Transaction ID  mandatory", {}));
  } else {
    var params = {
      user_id: req.body.user_id,
      team_id: req.body.team_id,
      shift_id: req.body.shift_id,
      lead_user_id: req.body.lead_user_id,
      type: req.body.type,
      game: req.body.game,
      amount: req.body.amount,
      platform: req.body.platform,
      fb_page: req.body.fb_page,
      backend: req.body.backend,
      client_info: req.body.client_info,
      isActive: req.body.isActive,
      transaction_id: req.body.transaction_id,
    };
    Transaction.EditTransaction(params, (err, data) => {
      if (data.affectedRows == "0") {
        return res.status(404).json(error("Transaction ID not Found :", {}));
      }

      if (!err) {
        return res
          .status(200)
          .json(success("User  Transaction Data Edit!  :", data));
      } else {
        return res.status(400).json(error("ERROR :", { err }));
      }
    });
  }
};

exports.Filter_transaction = async (req, res) => {
  console.log("Filter_transaction");
  const limit = parseInt(!!req.body.limit ? req.body.limit : 10);
  const page = parseInt(!!req.body.page ? req.body.page : 1);
  const sortBy = !!req.body.sortBy ? req.body.sortBy : "id";
  const sortDirection = !!req.body.sortDirection
    ? req.body.sortDirection
    : "ASC";

  var params = {
    limit: limit,
    page: page,
    sortBy: sortBy,
    sortDirection: sortDirection,
    user_id: req.body.user_id,
    team_id: req.body.team_id,
    shift_id: req.body.shift_id,
  };

  Transaction.FilterTransaction(params, (err, data) => {
    if (!err) {
      return res
        .status(200)
        .json(success(" Transaction Data !  :", { ...data }));
    } else {
      return res.status(400).json(error("ERROR :", { err }));
    }
  });
};
