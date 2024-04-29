const express = require("express");
const app = express();
const morgan = require("morgan");
const bodyParser = require("body-parser");

const usersRouter = require("./src/Routes/usersRouter");
const attendanceRouter = require("./src/Routes/attendanceRouter");
const transactionRouter = require("./src/Routes/transactionRouter");
const remarksRouter = require("./src/Routes/remarksRouter");
const { scheduleCronJob, sendEmail } = require("./src/CronJobs/nodecron.js");

app.use(morgan("dev"));

// Cron Job to Generate and send DB Backups to emails
const command = "./src/CronJobs/database_backup.sh";
const schedule = "0/52 * * * *"; // The cron syntax '0 */12 * * *' means the job will run at minute 0 past every 12th hour (0, 12), every day of the month, every month, and every day of the week.
// scheduleCronJob(command, schedule);

console.log("Fahad cron Job schedule: ", schedule);
//All API calls
app.use(
  bodyParser.json({
    limit: "50mb",
  })
);
// for parsing application/xwww-form-urlencoded
app.use(
  bodyParser.urlencoded({
    limit: "50mb",
    extended: true,
  })
);

app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");

  res.header(
    "Access-Control-Allow-Headers",
    "Origin,X-Request-With,context-Type,Accept,Authorization"
  );

  res.header(
    "Access-Control-Allow-Methods",
    "GET, POST, PUT, DELETE, PATCH, OPTIONS"
  );

  //Allow following headers for WEB Options calls
  if (req.method === "OPTIONS") {
    res.header(
      "Access-Control-Allow-Methods",
      "GET, POST, PUT, DELETE, PATCH, OPTIONS"
    );
    return res.status(200).json({});
  }
  next();
});

app.use("/api/user", usersRouter);
app.use("/api/attendance", attendanceRouter);
app.use("/api/attendance/remarks", remarksRouter);
app.use("/api/transaction", transactionRouter);

app.use((req, res, next) => {
  const error = new Error("NOT Found!");

  error.status = 404;
  next(error);
});

app.use((error, req, res, next) => {
  res.status(error.status || 500);
  res.json({
    error: {
      status: false,
      message: error.message,
    },
  });
});

module.exports = app;
