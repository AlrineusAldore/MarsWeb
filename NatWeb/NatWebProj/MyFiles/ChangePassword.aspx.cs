using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proj.MyFiles
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        public string errMsg;
        protected void Page_Load(object sender, EventArgs e)
        {
            string db = "Database.mdf";
            string sql = "";
            string selectQuery = "";

            if (Request.Form["changePassSubmit"] != null)
            {
                string username = Request.Form["username"];
                string oldPassword = Request.Form["oldPassword"];
                string newPassword = Request.Form["newPassword"];

                //select statement returns all the rows where both the username and password
                //are the exact same as the ones in the statement
                //(username is primary key so not more than 1 row)
                selectQuery = "SELECT * FROM Users WHERE username = '" + username + "' AND ";
                selectQuery += "password = '" + oldPassword + "'";

                //Update statement sets the password value to a new value for every row where
                //the username and password are the same as in the ones in the statement
                //(username is primary key so max of 1 password changed each time)
                sql = "UPDATE Users SET password='" + newPassword + "' WHERE username='";
                sql += username + "' AND password='" + oldPassword + "'";

                if (MyAdoHelper.IsExist(db, selectQuery)) //If user data match
                {
                    MyAdoHelper.DoQuery(db, sql);
                    errMsg = "The details were updated";
                }
                else
                    errMsg = "The details don't match";
            }
        }
    }
}