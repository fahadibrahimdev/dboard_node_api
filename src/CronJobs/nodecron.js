// const cron = require('node-cron');
// var shell = require('shelljs');
// // const { exec } = require('child_process');

// // Command to run your script, ensuring proper path and extension
// // const command = '/F/scripts ./database_backup.sh';




// // Schedule the cron job to run every 5 minutes
// cron.schedule('*/1 * * * *', () => {

//     if (shell.exec('bash F:/Git Projects/DBoard/dboard_node_api/src/CronJobs/database_backup.sh').code !== 0) {

//         shell.echo('Error: Bash Run Command failed');
//         shell.exit(1);
//       }

// //   exec(command, (error, stdout, stderr) => {
// //     if (error) {
// //       console.error('Error running script:', error);
// //       return;
// //     }

// //     console.log('Script output:', stdout);

// //     if (stderr) { // Only log stderr if it exists
// //       console.error('Script errors:', stderr);
// //     }
// //   });
// }, {
//   scheduled: true,
//   timezone: 'UTC' // Replace with your desired timezone (e.g., 'UTC', 'America/Los_Angeles')
// });


// console.log('Cron job started. It will run every 1 minutes in your specified timezone.');




const cron = require('node-cron');
const { exec } = require('child_process');

// Command to run your script with PowerShell
const command = 'powershell -Command "& {./database_backup.sh}"';

// Schedule the cron job to run every 1 minute
cron.schedule('*/1 * * * *', () => {
    exec(command, (error, stdout, stderr) => {
        if (error) {
            console.error('Error running script:', error);
            return;
        }

        console.log('Script output:', stdout);

        if (stderr) { // Only log stderr if it exists
            console.error('Script errors:', stderr);
        }
    });
}, {
    scheduled: true,
    timezone: 'UTC' // Replace with your desired timezone (e.g., 'UTC', 'America/New_York')
});

console.log('Cron job started. It will run every 1 minute in your specified timezone.');
