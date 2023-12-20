const { verify } = require("jsonwebtoken");
const sql = require("../Config/MYSQL_Configuration");
const Query = require("../Helpers/queryHelper");
class News {
  constructor(News) {
    this.news = News.news;
    this.id = News.id;
    this.active = News.active;
  }
  static async GetAllNews(result) {
    try {
      console.log("GetAllNews");
       var myQuery = `SELECT * FROM news`;
       const res = await Query.execute(myQuery);
       
       result(null, res);
     } catch (e) {
       result(e, null);
     }

   
  }
}

module.exports = News;
