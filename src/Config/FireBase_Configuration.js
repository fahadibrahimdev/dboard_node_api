const admin = require("firebase-admin");

// Initialize the app with downloaded service account credentials
admin.initializeApp({
  credential: admin.credential.cert({
    type: "service_account",
    project_id: "dboard-b6765",
    private_key_id: "8659b246baed4284f4cb18de05024b13ea8ba3c9",
    private_key:
      "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCoD5TzVzEXMOEp\njkNuKaBuTN1j2vszQYV8ZeuKwHIUwsAfd9kH0KIiG+QDaOr5FXsWl9NWojCDjuB9\nuDpZrHJFplm3wlhLJXEA+G1em07CRvH/hOoq13vn0llfL4Lc9hYL8xXPQqIs7PPO\nJTX6a2K6rR/hZkj482AUK8dvfYZXszkPP/MWGZE6tkKok5WvH5roMHCSqxD+KPLl\nOCtV/yOy/i1IlHI+goaBRaeZNYOBMWbB2JVLe3ZWeFWdmBO0pI5g817iQJj4veom\nOwf5HX7myqxKkvNyTvsmIbKbsK3ywxeU0YLV0xKGdy33iOAeEgJCfD8qXcGj4D3Q\nzjxLqipDAgMBAAECggEAQ4mngTcb+kbhZZLPVFkUKN9o5PUemBWPsFNBGgyGjANL\ntBm0tShJz81Hj3s9WoYgZg7zllAtkOD9JGjBwkHD1muoiGlolCJizFIJmchuGTLr\nk5T1iev41ku5MMBmJagbagfxTs5nYAiFXeWkUJORJJXoRuuVDb64cMK7LfnS4DD1\nIurFtVzbWoyTa040F7wIDCkcbwkbDMQuij+NjdCR2+qu/ISr2CSIL8CuNEnUAGY8\ngEyUWfRGPp8JouadIFZpPhQPS+yh9/nxoBMIaRC/3RUqQMqD7gJti9bXxqTtCKss\nuSqFz2vdrj8gqGTEclfSUrazfixInLBbEei6dptI+QKBgQDqApIkW2B7BByBwEAQ\nncj7S8qNJ7PDPcxGey1nIy3ITFUlXSt67DUbDYsLif1j3QjZ9idgZ7l10uJ3Ttd8\njNXratDtaw/eJPwYyTmYxCzTmKQH92NSZ4Lec2yC+OBDHyR69zkAUJXU32quGB54\nYN1a0Q1DJUEgR77D/9IycuiMVwKBgQC32oOYtBGj5nLkg34v/NtVw9THqlOYiiQC\n/NDOlfZYbn/KCf40vD0lHTsA8gKDmek5XL7WcYA7wmnwwdEzswEjDI5X1+gcib+k\n9h74IkGjil35vIkTpcWsBPJAfGwgtGB/ATIlopZpopvLjIIaw5bXOOQewtULGxfs\nWzATnLod9QKBgEwpfgsbOnGPSv/n5HIECK/RYSFD9Lvs1xlxabuRtYrlXSkGA+rE\nChy98a1VwgTIoeLevL4hxDjW5CJUpMnCxLUUVN+Q4t84RlyC0Z4o6zYLDggRul/N\nlMh15LFT8xmlfygOYpz5nWplNMFo1DH1xNWUCK775xBsiWgdUPpeb9WNAoGAK+DZ\n0WMAZsaEGyeKwTcuvaxMJw7ufpRRfekKiJNfxMEyfGygH8PhL+9m+pXHpdLgx5Dr\n9tAF071VfWE0ZYtONSg0/KAJxG3XsC4RPBUo5zgJr6WgbXD92U0g5+UKBVAnS4hk\niHjiPvnRBuZU0sBlSp5IS1Mid1ETB5THx5Z7ENUCgYA84yc89jFvrzc0MOHEcyn6\nQtqubtYbldaFk0knMoKhsY7sQ6nNMsDdSFMIh7om1D4pv9gxDp7hPEddGKwf46RL\nWPA0Vd+94jpb397eHwDgY7v83kCo38H2t7cWThDVMSG7XEKz/7KvM0I4bguBR8nY\nniAYDAXQBDJADrQakXiWyw==\n-----END PRIVATE KEY-----\n",
    client_email:
      "firebase-adminsdk-6lghh@dboard-b6765.iam.gserviceaccount.com",
    client_id: "113046267735117531899",
    auth_uri: "https://accounts.google.com/o/oauth2/auth",
    token_uri: "https://oauth2.googleapis.com/token",
    auth_provider_x509_cert_url: "https://www.googleapis.com/oauth2/v1/certs",
    client_x509_cert_url:
      "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-6lghh%40dboard-b6765.iam.gserviceaccount.com",
    universe_domain: "googleapis.com",

    //  (replace with JSON file content)
  }),
  // databaseURL: 'https://your-project-id.firebaseio.com' (optional)
});

module.exports = admin;
