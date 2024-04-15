const Query = require("../Helpers/queryHelper");

class Transaction {
  constructor(Transaction) {
    this.id = Transaction.id;
    this.user_id = Transaction.user_id;
    this.team_id = Transaction.teams_id;
    this.shift_id = Transaction.shift_id;
    this.lead_user_id = Transaction.lead_user_id;
    this.type = Transaction.type;
    this.game = Transaction.game;
    this.amount = Transaction.amount;
    this.created_by = Transaction.created_by;
    this.deleted_by = Transaction.deleted_by;
    this.approved_by = Transaction.approved_by;
    this.modify_by = Transaction.modify_by;
    this.created_time = Transaction.created_time;
    this.deleted_time = Transaction.deleted_time;
    this.modify_time = Transaction.modify_time;
    this.approved_time = Transaction.approved_time;
    this.platform = Transaction.approved_time;
    this.fb_page = Transaction.fb_page;
    this.backend = Transaction.backend;
    this.client_info = Transaction.client_info;
    this.is_active = Transaction.is_active;
  }
  static async GetTransaction(body, result) {
    try {
      console.log("GetTransaction");
      var myQuery = "SELECT * FROM transaction WHERE user_id =" + body.UserID;
      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async GetTransactionBYTeamID(body, result) {
    try {
      console.log("GetTransaction");
      var myQuery = `SELECT * FROM transaction WHERE team_id =` + body.team_id;
      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async CreatTransaction(body, result) {
    try {
      console.log("CreatTransaction");
      var myQuery =
        "INSERT INTO transaction (id, user_id, team_id, shift_id, lead_user_id, type, game, amount, created_by, approved_by, deleted_by, modify_by, created_time, approved_time, deleted_time, modify_time, platform, fb_page, backend, client_info, is_active) VALUES (NULL," +
        body.UserID +
        "," +
        body.team_id +
        "," +
        body.shift_id +
        "," +
        body.lead_user_id +
        "," +
        body.type +
        "," +
        body.game +
        "," +
        body.amount +
        "," +
        body.UserID +
        "," +
        " NULL, NULL, NULL ,'" + 
        body.created_time +
        "', NULL, NULL, NULL " +
        ",'" +
        body.platform +
        "','" +
        body.fb_page +
        "','" +
        body.backend +
        "','" +
        body.client_info +
        "'," +
        body.is_active +
        ")";
      console.log("myQuery :", myQuery);
      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async DeletedTransaction(body, result) {
    try {
      console.log("DeletedTransaction");
      var myQuery =
        "UPDATE transaction SET  deleted_by= " +
        body.UserID +
        ",deleted_time= '/" +
        body.deleted_time +
        "/' WHERE transaction.id =" +
        body.transaction_id;
      const res = await Query.execute(myQuery);

      result(null, res);
    } catch (e) {
      result(e, null);
    }
  }

  static async ApprovedTransaction(body, result) {
    try {
      console.log("DeniedTransaction");
      var myQuery =
        "UPDATE transaction SET  approved_by =" +
        body.UserID +
        ", denied_time ='" +
        body.Time +
        "' WHERE transaction.id =" +
        body.transaction_id;

      const res = await Query.execute(myQuery);
      result(null, res);
    } catch (err) {
      result(err, null);
    }
  }

  static async DeniedTransaction(body, result) {
    try {
      console.log("DeniedTransaction");
      var myQuery =
        "UPDATE transaction SET  denied_by =" +
        body.UserID +
        ", denied_time ='" +
        body.Time +
        "' WHERE transaction.id =" +
        body.transaction_id;

      const res = await Query.execute(myQuery);
      result(null, res);
    } catch (err) {
      result(err, null);
    }
  }

  static async EditTransaction(body, result) {
    try {
      console.log("EditTransaction");
      var myQuery = "UPDATE transaction SET ";

      if (!!body.user_id) {
        myQuery = myQuery + "user_id = " + body.user_id + ",";
      }

      if (!!body.team_id) {
        myQuery = myQuery + "team_id = " + body.team_id + ",";
      }

      if (!!body.shift_id) {
        myQuery = myQuery + "shift_id = " + body.shift_id + ",";
      }
      if (!!body.lead_user_id) {
        myQuery = myQuery + "lead_user_id = " + body.lead_user_id + ",";
      }
      if (!!body.type) {
        myQuery = myQuery + "type = " + body.type + ",";
      }
      if (!!body.game) {
        myQuery = myQuery + "game = " + body.game + ",";
      }
      if (!!body.amount) {
        myQuery = myQuery + "amount = " + body.amount + ",";
      }
      if (!!body.platform) {
        myQuery = myQuery + "platform = '" + body.platform + "',";
      }
      if (!!body.fb_page) {
        myQuery = myQuery + "fb_page = '" + body.fb_page + "',";
      }
      if (!!body.backend) {
        myQuery = myQuery + "backend = '" + body.backend + "',";
      }
      if (!!body.client_info) {
        myQuery = myQuery + "client_info = '" + body.client_info + "',";
      }
      if (!!body.IsActive) {
        myQuery = myQuery + "IsActive = " + body.IsActive + ",";
      }
      console.log("myQUrey1: ", myQuery);
      myQuery = myQuery.slice(0, -1);
      console.log("myQUrey2: ", myQuery);
      myQuery = myQuery + " WHERE transaction.id = " + body.transaction_id;
      console.log("myQUrey3: ", myQuery);
      const res = await Query.execute(myQuery);
      result(null, res);
    } catch (err) {
      result(err, null);
    }
  }

  static async FilterTransaction(body, result) {
    try {
      console.log("EditTransaction");
      var myBaseDataQuery = "SELECT * FROM transaction ";
      var myBaseTotalQuery = "SELECT COUNT(*) AS count FROM transaction ";

      var myWhereQuery = "";

      if (!!body.user_id) {
        myWhereQuery =
          myWhereQuery + "transaction.user_id = " + body.user_id + " AND ";
      }
      if (!!body.team_id) {
        myWhereQuery =
          myWhereQuery + "transaction.team_id = " + body.team_id + " AND ";
      }
      if (!!body.shift_id) {
        myWhereQuery =
          myWhereQuery + "transaction.shift_id = " + body.shift_id + " AND ";
      }
      if (!!body.lead_user_id) {
        myWhereQuery =
          myWhereQuery +
          "transaction.lead_user_id = " +
          body.lead_user_id +
          " AND ";
      }
      if (!!body.type) {
        myWhereQuery =
          myWhereQuery + "transaction.type = " + body.type + " AND ";
      }
      if (!!body.game) {
        myWhereQuery =
          myWhereQuery + "transaction.game = " + body.game + " AND ";
      }
      if (!!body.amount) {
        myWhereQuery =
          myWhereQuery + "transaction.amount = " + body.amount + " AND ";
      }
      if (!!body.platform) {
        myWhereQuery =
          myWhereQuery + "transaction.platform = '" + body.platform + "' AND ";
      }
      if (!!body.fb_page) {
        myWhereQuery =
          myWhereQuery + "transaction.fb_page LIKE '%" + body.fb_page + "%' AND ";
      }
      if (!!body.backend) {
        myWhereQuery =
          myWhereQuery + "transaction.backend = '" + body.backend + "' AND ";
      }
      if (!!body.client_info) {
        myWhereQuery =
          myWhereQuery +
          "transaction.client_info = '" +
          body.client_info +
          "' AND ";
      }
      if (!!body.is_active) {
        myWhereQuery =
          myWhereQuery + "transaction.is_active = " + body.is_active + " AND ";
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

      var myDataCompleteQuery = myBaseDataQuery + myWhereQuery + mySortQuery;
      var myTotalCompleteQuery = myBaseTotalQuery + myWhereQuery;

      const myData = await Query.execute(myDataCompleteQuery);
      const myTotalData = await Query.execute(myTotalCompleteQuery);

      const totalPage = Math.ceil(myTotalData[0].count / body.limit);
      const totalRecord =myTotalData[0].count;

      const res = {
        transactions: myData,
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
}

module.exports = Transaction;
