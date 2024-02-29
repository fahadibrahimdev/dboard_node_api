const os = require("os");
const express = require("express");
const cluster = require("cluster");
const morgan = require("morgan");
const bodyParser = require("body-parser");

const usersRouter = require("./src/Routes/usersRouter");
const attendanceRouter = require("./src/Routes/attendanceRouter");
const transactionRouter = require("./src/Routes/transactionRouter");
const remarksRouter = require("./src/Routes/remarksRouter");

const totalCpu = os.cpus().length;
console.log("totalCpu:", totalCpu);

if (cluster.isPrimary) {
  for (let i = 0; i < totalCpu; i++) {
    cluster.fork();
  }
} else {
  const app = express();
  const port = process.env.PORT || 3000;
  app.use(morgan("dev"));

  app.use(
    bodyParser.json({
      limit: "50mb",
    })
  );

  app.use(
    bodyParser.urlencoded({
      limit: "50mb",
      extended: true,
    })
  );

  app.use((req, res, next) => {
    if (cluster.worker) {
      console.log(`Request handled by CPU core: ${cluster.worker.process.pid % totalCpu}`);
    }
    res.header("Access-Control-Allow-Origin", "*");
    res.header(
      "Access-Control-Allow-Headers",
      "Origin, X-Requested-With, Content-Type, Accept, Authorization"
    );
    res.header(
      "Access-Control-Allow-Methods",
      "GET, POST, PUT, DELETE, PATCH, OPTIONS"
    );

    if (req.method === "OPTIONS") {
      res.header(
        "Access-Control-Allow-Methods",
        "GET, POST, PUT, DELETE, PATCH, OPTIONS"
      );
      return res.status(200).json({});
    }
    next();
  });

  app.use("/mab/user", usersRouter);
  app.use("/mab/attendance", attendanceRouter);
  app.use("/mab/attendance/remarks", remarksRouter);
  app.use("/mab/transaction", transactionRouter);

  app.use((req, res, next) => {
    const error = new Error("Not Found!");
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

  app.listen(port, () => {
    console.log(`Worker ${cluster.worker.id} listening on port ${port}`);
  });
}
