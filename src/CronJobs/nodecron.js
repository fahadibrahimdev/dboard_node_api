const cron = require('node-cron');
const { exec } = require('child_process');

// Command to run your script with PowerShell
// const command = 'powershell -Command "& {./database_backup.sh}"';
exports.scheduleCronJob = function(command, schedule) {
    cron.schedule(schedule, () => {
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

    console.log(`Cron job started. It will run ${schedule} in your specified timezone.`);
};