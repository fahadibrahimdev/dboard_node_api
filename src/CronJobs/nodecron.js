const cron = require("node-cron");
const { exec } = require("child_process");
const {
  getCurrentDateTimeString,
  sendEmail,
  sendEmailWithAttachment,
} = require("../Utils.js/CommonUtils");

// Command to run your script with PowerShell
// const command = 'powershell -Command "& {./database_backup.sh}"';

exports.scheduleCronJob = function (command, schedule) {
  cron.schedule(
    schedule,
    () => {
      const child = exec(command, (error, stdout, stderr) => {
        if (error) {
          console.error("Error running script:", error);
          return;
        } else if (stderr) {
          // Only log stderr if it exists
          console.error("Script errors:", stderr);
          return;
        }
      });

      // Event listener for the exit event
      child.on("exit", (code) => {
        if (code === 0) {
          console.log("Script completed successfully.");

          // Add your logic here to handle successful completion

          const fileName = "backup_" + getCurrentDateTimeString() + ".sql";
          console.log("FileName:", fileName);
          var params = {
            to: "meerasad636@gmail.com",
            text: "Hello from DBoard DB Admin! This email has an attachment check it out!",
            filePath: "./Database_Info/Backups/" + fileName,
            subject:
              "DB Backup with Attachment(" + process.env.Environment + ")",
          };
          sendEmailWithAttachment(params);
        } else {
          // Add your logic here to handle failure
          console.error("Script exited with code:", code);

          var params = {
            to: "meerasad636@gmail.com",
            text:
              "Hello from DBoard DB Admin! This email has no attachment. Due to Error Code: " +
              code,
            subject:"DB Backup with Attachment(" + process.env.Environment + ")",
          };
          sendEmail(params);
        }
      });
    },
    {
      scheduled: true,
      timezone: "UTC", // Replace with your desired timezone (e.g., 'UTC', 'America/New_York')
    }
  );

  console.log(
    `Cron job started. It will run ${schedule} in your specified timezone.`
  );
};
