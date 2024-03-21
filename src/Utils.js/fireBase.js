const firebase_admin = require("../Config/FireBase_Configuration.js");
// Access messaging service
const messaging = firebase_admin.messaging();

const pushNotificationSingle = async (
  registrationToken,
  notificationPayload
) => {
  try {
    const message = {
      notification: notificationPayload, // Notification message content
      token: registrationToken,
    };

    const response = await messaging.send(message);
    console.log("Notification sent successfully:", response);
    return Promise.resolve(); // Resolve the promise after successful sending
  } catch (error) {
    console.error("Error sending notification:", error);
    return Promise.reject(error); // Reject the promise on error
  }
};

exports.pushNotificationMulti = async (
  registrationToken,
  notificationPayload
) => {
  // Example usage (replace with your actual logic)
  // const registrationToken =
  //   "ezNiZnyiSYKJenINFQAOvT:APA91bFKQfob1USeI8wWkK9hauC331-yFGc5i9wdCwQyasUYJgbviaSEaybalXrZ_UEQp6Ev7ADqYldVVXriSm6orc6rfIrnPkX2HYhR7dvY9W_YPnJsHIWleolAgQKYxMkXzpdIMcQZ";
  // const notificationPayload = {
  //   image: 'https://banner2.cleanpng.com/20201008/rtv/transparent-google-suite-icon-google-icon-5f7f985ccd60e3.5687494416021975968412.jpg',
  //   title: "Breaking News!",
  //   body: "Important update available.",
  // };

  for (const token of registrationToken) {
    await pushNotificationSingle(token, notificationPayload);
    console.log("Notification sent to:", token);
  }
  console.log("All notifications sent!");
};
