const jwt = require("jsonwebtoken");
const multer = require("multer");
const News = require("../Models/News.js");
const User = require("../Models/User.js");
const User_activity = require("../Models/User_activity.js");
const Permission = require("../Models/Permission.js");
const LookUp = require("../Models/LookUp.js");
const { success, error } = require("../Response/API-Response.js");
const promise = require("bcrypt/promises.js");
const user_details = require("../Models/User_details.js");

exports.Login_User = (req, res) => {
  console.log("Login");

  if (
    !!req.body.user_name == false ||
    !!req.body.password == false ||
    !!req.body.device_token == false ||
    !!req.body.platform == false
  ) {
    return res
      .status(400)
      .json(error("user_name/password/device_token/platfoam not provided", {}));
  } else if (req.body.user_name.length < 3) {
    return res.status(400).json(error("user_name can't be less than 3", {}));
  } else if (req.body.password.length < 6) {
    return res.status(400).json(error("password can't be less than 6", {}));
  } else {
    var params = {
      UserName: req.body.user_name,
      Password: req.body.password,
    };

    User.FindCurrentRegisteredUser(
      params,

      (err, user) => {
        if (err || user.length < 1) {
          return res
            .status(400)
            .json(
              error("No Account Exists against this user_name/password", {})
            );
        } else if (user.length > 0 && user[0].new_user_req === 1) {
          return (
            res
              .status(403) //403 code implies that access is forbidden
              // due to other reasons, such as insufficient permissions or authentication failure.
              .json(
                error(
                  "Currently your account request is in pending status. Kindly try again later!"
                )
              )
          );
        } else if (user.length > 0) {
          const token = jwt.sign(
            {
              UserID: user[0].id,
              Email: user[0].email,
              UserName: user[0].user_name,
            },
            process.env.JWT_KEY,
            {
              expiresIn: "40d",
            }

          );

          var params2 = {
            DeviceToken: req.body.device_token,
            Platform: req.body.platform,
            UserID: user[0].id,
          };
          User.UpdateTokenInfo(
            params2,

            (err, _data) => {
              if (!err) {
                user[0].device_token = req.body.device_token;
                user[0].platform = req.body.platform;

                user[0].is_super_user = !!user[0].is_super_user;

                return res.status(200).json(
                  success("Login Successfull", {
                    token: token,
                    user: user[0],
                  })
                );
              } else {
                return res.status(400).json(error("Login Unsuccessfull", err));
              }
            }
          );
        } else {
          return res.status(400).json(error("Login Unsuccessfull", {}));
        }
      }
    );
  }
};

exports.Login_UserV2 = (req, res) => {
  console.log("Login V2");

  if (
    !!req.body.user_name == false ||
    !!req.body.password == false ||
    !!req.body.device_token == false ||
    !!req.body.platfoam == false
  ) {
    return res
      .status(400)
      .json(error("user_name/password/device_token/platfoam not provided", {}));
  } else if (req.body.user_name.length < 3) {
    return res.status(400).json(error("user_name can't be less than 3", {}));
  } else if (req.body.password.length < 6) {
    return res.status(400).json(error("password can't be less than 6", {}));
  } else {
    var params = {
      UserName: req.body.user_name,
      Password: req.body.password,
    };

    User.FindCurrentRegisteredUser(
      params,

      (err, user) => {
        if (err || user.length < 1) {
          return res
            .status(400)
            .json(
              error("No Account Exists against this user_name/password", {})
            );
        } else if (user.length > 0 && user[0].new_user_req === 1) {
          return (
            res
              .status(403) //403 code implies that access is forbidden
              // due to other reasons, such as insufficient permissions or authentication failure.
              .json(
                error(
                  "Currently your account request is in pending status. Kindly try again later!"
                )
              )
          );
        } else if (user.length > 0) {
          const token = jwt.sign(
            {
              UserID: user[0].id,
              Email: user[0].email,
              UserName: user[0].user_name,
            },
            process.env.JWT_KEY,
            {
              expiresIn: "40d",
            }
          );

          var params2 = {
            DeviceToken: req.body.device_token,
            DeviceInfo: !!req.body.device_info ? req.body.device_info : "",
            Platfoam: req.body.platfoam,
            Login_time: new Date().toISOString(),
            Logout_time: new Date().toISOString(),
            UserID: user[0].id,
          };

          User_activity.UpdateTokenInfoV2(params2, (err, _data) => {
            User_activity.insert_user_activity(params2, (err, _data) => {
              if (!err) {
                user[0].device_token = req.body.device_token;
                user[0].platform = req.body.platform;
                user[0].is_super_user = !!user[0].is_super_user;

                return res.status(200).json(
                  success("Login Successfull", {
                    token: token,
                    user: user[0],
                  })
                );
              } else {
                return res.status(400).json(error("Login Unsuccessfull", err));
              }
            });
          });
        } else {
          return res.status(400).json(error("Login Unsuccessfull", {}));
        }
      }
    );
  }
};

exports.Signup_User = (req, res) => {
  console.log("SignUp API called!");

  if (
    (!!req.body.user_name == false && req.body.user_name.length) ||
    !!req.body.password == false ||
    !!req.body.full_name == false
  ) {
    return res
      .status(400)
      .json(error("UserName/Password/FullName not provided", {}));
  } else {
    User.FindCurrentRegisteredUserByUserName(
      req.body.user_name,
      (err, user) => {
        if (err) {
          return res.status(500).json(error("Error Handling Information", err));
        } else if (user.length > 0) {
          return res
            .status(400)
            .json(
              error(
                "This UserName was previously used, Try an alternating UserName or contact support.",
                {}
              )
            );
        } else if (user.length < 1) {
          const newUser = new User({
            email: !!req.body.email ? req.body.email : "",
            password: req.body.password,
            user_name: req.body.user_name,
            full_name: req.body.full_name,
            mobile: !!req.body.mobile ? req.body.mobile : "",
            device_token: !!req.body.device_token ? req.body.device_token : "",
            platform: !!req.body.platform ? req.body.platform : "",
            is_super_user: !!req.body.is_super_user
              ? req.body.is_super_user
              : 0,
            role: !!req.body.role ? req.body.role : 1,
            new_user_req: !!req.body.new_user_req ? req.body.new_user_req : 1,
          });

          User.Register(newUser, (err, data) => {
            console.log(data);
            console.log("insertedID: ", data.insertId);
            if (data != null) {
              const token = jwt.sign(
                {
                  Email: newUser.email,
                  UserName: newUser.user_name,

                  UserID: data.insertId,
                },
                process.env.JWT_KEY,
                {
                  expiresIn: "40d",
                }
              );
              User.IntersionInPermission(data.insertId, (err, data2) => {
                if (err) {
                  console.log("Err:", err);
                  res.status(400).json(error("NOt a super user"));
                } else {
                  return res.status(200).json(
                    success("Signup Successfull", {
                      token: token,
                      user: newUser,
                    })
                  );
                }
              });
            } else {
              return res
                .status(400)
                .json(error("Some Error Occurred while Creating Player", err));
            }
          });
        } else {
          return res.status(400).json(error("Signup Unsuccessfull", {}));
        }
      }
    );
  }
};

exports.Heart_Beat = (req, res) => {
  console.log("HeartBeat");
  if (!!req.userData.UserID == false) {
    return res.status(400).json(error("User ID (Auth) can't null", {}));
  } else {
    var params = {
      UserID: req.userData.UserID,
    };
    User.FindUserByid(params, (err, user) => {
      if (err) {
        return res.status(200).json(error("Error while fetching User", {}));
      } else if (user.data.length < 1) {
        return res
          .status(400)
          .json(
            error("ID not found, Try an Alternating ID or Contact Support", {})
          );
      }

      let myPermissions = [];
      let userData = [];
      let myNews = [];
      let myGame = [];
      let myTeams = [];
      let myTransactionTypes = [];
      let myShift = [];
      let userTeams = [];
      let userGame = [];
      let userShift = [];
      let Status = [];
      let userdetails = [];

      let firstPromise = () => {
        var params = {
          UserID: req.userData.UserID,
        };
        return new Promise((resolve, reject) => {
          Permission.GetAllPermission(params, (err, PermissionData) => {
            if (err) {
              myPermissions = [];
            } else {
              myPermissions = PermissionData;
            }
            resolve("Completed!");
          });
        });
      };

      let secondPromise = () => {
        return new Promise((resolve, reject) => {
          News.GetAllNews((err, Newsdata) => {
            if (!err) {
              myNews = Newsdata;
            } else {
              myNews = [];
            }
            resolve("Completed!");
          });
        });
      };

      let thirdPromise = () => {
        return new Promise((resolve, reject) => {
          LookUp.GetAllGame((err, GamesData) => {
            if (!err) {
              myGame = GamesData;
            } else {
              myGame = [];
            }
            resolve("Completed!");
          });
        });
      };

      let forthPromise = () => {
        return new Promise((resolve, reject) => {
          LookUp.GetAllTeams((err, TeamsData) => {
            if (!err) {
              myTeams = TeamsData;
            } else {
              myTeams = [];
            }
            resolve("Completed!");
          });
        });
      };

      let fifthPromise = () => {
        return new Promise((resolve, reject) => {
          LookUp.GetAllTransactionTypes((err, TransactionTypesData) => {
            if (!err) {
              myTransactionTypes = TransactionTypesData;
            } else {
              myTransactionTypes = [];
            }
            resolve("Completed!");
          });
        });
      };

      let sixthPromise = () => {
        return new Promise((resolve, reject) => {
          LookUp.GetAllShift((err, ShiftData) => {
            if (!err) {
              myShift = ShiftData;
            } else {
              myShift = [];
            }
            resolve("Completed!");
          });
        });
      };

      let seventhPromise = () => {
        var params = {
          UserID: req.userData.UserID,
        };
        return new Promise((resolve, reject) => {
          LookUp.GetAllUserTeams(params, (err, userTeamsData) => {
            if (!err) {
              userTeams = userTeamsData;
            } else {
              userTeams = [];
            }
            resolve("Completed!");
          });
        });
      };

      let eigthPromise = () => {
        var params = {
          UserID: req.userData.UserID,
        };
        return new Promise((resolve, reject) => {
          LookUp.GetAllUserShift(params, (err, userShiftData) => {
            if (!err) {
              userShift = userShiftData;
            } else {
              userShift = [];
            }
            resolve("Completed!");
          });
        });
      };

      let ninethPromise = () => {
        var params = {
          UserID: req.userData.UserID,
        };
        return new Promise((resolve, reject) => {
          LookUp.GetAllUserGame(params, (err, userGameData) => {
            if (!err) {
              userGame = userGameData;
            } else {
              userGame = [];
            }
            resolve("Completed!");
          });
        });
      };

      let tenthPromise = () => {
        return new Promise((resolve, reject) => {
          LookUp.GetAllStatus((err, status) => {
            if (!err) {
              Status = status;
            } else {
              Status = [];
            }
            resolve("Completed!");
          });
        });
      };
      let elventhPromise = () => {
        var params = {
          UserID: req.userData.UserID,
        };
        return new Promise((resolve, reject) => {
          User.UserData(params, (err, userdata) => {
            if (!err) {
              userData = userdata;
            } else {
              userData = [];
            }
            resolve("Completed!");
          });
        });
      };
      let twelvethPromise = () => {
        var params = {
          UserID: req.userData.UserID,
        };
        return new Promise((resolve, reject) => {
          user_details.Get_All_User_Details(params, (err, userdetailsdata) => {
            if (!err) {
              userdetails = userdetailsdata[0].flags !== 0;
            } else {
              userdetails = false;
            }
            resolve("Completed!");
          });
        });
      };

      // Async function to perform execution of all promise
      let promiseExecution = async () => {
        let promise = await Promise.all([
          firstPromise(),
          secondPromise(),
          thirdPromise(),
          forthPromise(),
          fifthPromise(),
          sixthPromise(),
          seventhPromise(),
          eigthPromise(),
          ninethPromise(),
          tenthPromise(),
          elventhPromise(),
          twelvethPromise(),
        ]);
        console.log(promise);

        res.status(200).json(
          success(" HeartBeats DAta", {
            user: user.data[0],
            all_notifications_seen: userdetails,
            permission: myPermissions,
            user_data: userData[0],
            user_lookups: {
              game_data: userGame,
              teams: userTeams,
              shift_data: userShift,
            },

            system_lookups: {
              news: myNews,
              game_data: myGame,
              teams: myTeams,
              transaction_types: myTransactionTypes,
              shift_data: myShift,
              status_data: Status,
            },
          })
        );
      };

      // Function call
      promiseExecution();
    });
  }
};

exports.Update_Profile = (req, res) => {
  const pUsername = !!req.body.user_name ? req.body.user_name.trim() : "";

  if (
    !!pUsername == false &&
    !!req.body.password == false &&
    !!req.file == false &&
    !!req.body.email == false &&
    !!req.body.mobile == false &&
    !!req.body.full_name == false
  ) {
    return res
      .status(400)
      .json(error("UserName OR Password OR image OR email must be passed", {}));
  } else {
    var params = {
      UserID: req.userData.UserID,
      user_name: pUsername,
      password: req.body.password,
      image: req.file,
      email: req.body.email,
      mobile: req.body.mobile,
      full_name: req.body.full_name,
    };
    User.Update_Profile(params, (err, _updateprofile) => {
      if (err) {
        return res.status(400).json(error("USER NAME ALREADY IN USE"));
      } else {
        return res.status(200).json(success(" UPDATED"));
      }
    });
  }
};

exports.Chnage_Password = (req, res) => {
  console.log("Chnage_Password");

  if (
    !!req.body.user_name == false ||
    !!req.body.old_password == false ||
    !!req.body.new_password == false
  ) {
    return res
      .status(400)
      .json(error("user_name/old_password/new_password not provided", {}));
  } else if (req.body.old_password == req.body.new_password) {
    return res
      .status(400)
      .json(error("Old Password Same to your's New Password", {}));
  } else if (req.body.new_password.length < 6) {
    return res
      .status(400)
      .json(error("new_password not less then 6 digit", {}));
  } else {
    var params = {
      UserName: req.body.user_name,
      OldPassword: req.body.old_password,
      NewPassword: req.body.new_password,
    };

    User.FindCurrentPasswordUser(
      params,

      (err, data) => {
        if (err || data.length < 1) {
          return res
            .status(400)
            .json(
              error("No Account Exists against this UserName/Password", {})
            );
        } else if (data.length > 0) {
          User.UpdatePasswordInfo(
            params,

            (err, _data) => {
              if (!err) {
                return res.status(200).json(success("Password Updated!"));
              } else {
                return res.status(400).json(error("Password Not Updated", err));
              }
            }
          );
        }
      }
    );
  }
};

exports.Logout = (req, res) => {
  console.log("Logout");

  if (!!req.body.user_id == false || !!req.body.platfoam == false) {
    return res.status(400).json(error("user_id/platfoam not provided", {}));
  } else {
    var params = {
      UserID: req.body.user_id,
      platfoam: req.body.platfoam,
      Logout_time: new Date().toISOString(),
      Deviceinfo: !!req.body.DeviceInfo ? req.body.DeviceInfo : "",
    };

    User.Logout(params, (err, _data) => {
      // if (err || _data.changedRows < 1) {
      //   return res.status(400).json(error("Logout unsuccessful!!"));
      // } else {
      //   if (_data.changedRows == 1) {
      //     return res.status(200).json(error("Logout successfull", err));
      //   }
      //   return res.status(400).json(error("ERROR!!", err));
      // }
      return res.status(200).json(success("Logout successfull", success));
    });
  }
};

exports.Delete_User = (req, res) => {
  console.log("Delete");

  if (!!req.body.user_name == false || !!req.body.password == false) {
    return res.status(400).json(error("user_name/password not provided", {}));
  } else {
    var params = {
      UserName: req.body.user_name,
      Password: req.body.password,
      Deleted_By: !!req.body.deleted_by ? req.body.deleted_by : 1,
      Deleted_Time: new Date().toISOString(),
    };

    User.FindCurrentRegisteredUser(
      params,

      (err, user) => {
        if (err || user.length < 1) {
          return res
            .status(400)
            .json(
              error("No Account Exists against this user_name/password", {})
            );
        } else if (user.length > 0) {
          User.DeletedUser(
            params,

            (err, data) => {
              if (err) {
                return res
                  .status(400)
                  .json(
                    error(
                      "No Account Exists against this user_name/password",
                      {}
                    )
                  );
              } else {
                return res
                  .status(200)
                  .json(
                    success(
                      "This user_name/password user deleted successfull",
                      {}
                    )
                  );
              }
            }
          );
        } else {
          return res.status(400).json(error("Delete User unsuccessfull", {}));
        }
      }
    );
  }
};
exports.Update_Flags = (req, res) => {
  console.log("Update_Flags");

  if (!!req.userData.UserID == false) {
    return res.status(400).json(error("UserID is mandatory", {}));
  } else {
    var params = {
      UserID: req.userData.UserID,
    };

    user_details.Update_User_Flags_Details(params, (err, data) => {
      if (!err) {
        return res.status(200).json(success("User Veiw All Notification  :"));
      } else {
        return res.status(400).json(error("ERROR :", { err }));
      }
    });
  }
};
