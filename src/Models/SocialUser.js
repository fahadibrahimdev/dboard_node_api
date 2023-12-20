const sql = require("../Config/MYSQL_Configuration");

class SocialUser {
  constructor(SocialUser) {
    this.id = SocialUser.id;
    this.user_id = SocialUser.user_id;
    this.social_platform = SocialUser.social_platform;
    this.social_id = SocialUser.social_id;
    this.social_name = SocialUser.social_name;
  }
  static AddNewSocialUser(newSocialInfo, result) {
    console.log("Social Info Register");
    sql.query(`INSERT INTO social_info SET ?`, newSocialInfo, (err, res) => {
      if (res) {
        result(null, res);
      } else {
        result(err, null);
      }
    });
  }
}



module.exports = SocialUser;
