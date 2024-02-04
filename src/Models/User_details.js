const { verify } = require("jsonwebtoken");
const sql = require("../Config/MYSQL_Configuration");
const Query = require("../Helpers/queryHelper");
class user_details {
  constructor(user_details) {
    this.user_id = user_details.user_id;
    this.id = user_details.id;
    this.flags = user_details.flags;
  }
  static async GetAlluser_details(body,result) {
    try {
      console.log("Get All user_details");
       var myQuery = 'SELECT id,flags,news_id FROM user_details where user_id ='+ body.UserID;
       const res = await Query.execute(myQuery);
       
       result(null, res);
     } catch (e) {
       result(e, null);
     }

   
  }
}

module.exports = user_details;
