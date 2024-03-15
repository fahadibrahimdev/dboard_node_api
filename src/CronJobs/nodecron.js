const nodemailer =require("nodemailer");

const cron = require('node-cron');
const { exec } = require('child_process');

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




exports.sendEmail=function(req,res) {
    // Create a transporter object using SMTP transport
    let transporter = nodemailer.createTransport({
        host: 'mail.thundertechsol.com', // Your cPanel SMTP server address
        port: 465, // Default SMTP port for secure connections
        secure: true, // Use SSL/TLS
        auth: {
            user: 'fahad_e@thundertechsol.com', // Your Gmail address
            pass: 'VERdd123$fahad' // Your Gmail password
        }
    });

    // Set up email data
    let mailOptions = {
        from: 'fahad_e@thundertechsol.com', // Sender address
        to: 'meerasad636@gmail.com', // List of recipients
        subject: 'Test Email', // Subject line
        text: 'Hello from Node.js!', // Plain text body
        // You can also use html instead of text if you want to send HTML content
        // html: '<b>Hello from Node.js!</b>'
    };

    // Send mail with defined transport object
    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            return console.log(error);
        }
        console.log('Message sent: %s', info.messageId);
    });
}


