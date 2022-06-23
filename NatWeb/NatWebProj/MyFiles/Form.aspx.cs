using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Proj
{
    public partial class Form : System.Web.UI.Page
    {
        public string errMsg;

        protected void Page_Load(object sender, EventArgs e)
        {
            string db = "Database.mdf";
            string tableName = "Users";
            errMsg = "";

            //If tried to sign up
            if (Request.Form["signupSubmit"] != null)
            {
                string username = Request.Form["signupUsername"];
                string password = Request.Form["signupPassword"];
                string email = Request.Form["email"];
                string gender = Request.Form["gender"];

                //select statement returns all the rows where the username
                //is the exact same as the one in the statement
                //(username is primary key so not more than 1 row)
                string statement = "SELECT * FROM " + tableName;
                statement += " WHERE username='" +username+ "'";

                //If there is a user with that username in the database (there are more
                //than 0 rows returned from statement)
                if (MyAdoHelper.IsExist(db, statement))
                {
                    //show error msg if username already exists
                    errMsg = "Username already exists";
                }
                else //if successfully logged in
                {
                    //insert statement inserts to table in database a new row with the values
                    //we give it
                    statement = "INSERT INTO users (username, password, email, gender) VALUES ('";
                    statement += username + "', '" + password + "', '" + email + "', '" + gender + "')";
                    MyAdoHelper.DoQuery(db, statement); //insert user to database

                    //Save username and redirect to front page
                    Session["username"] = username;
                    Response.Redirect("frontPage.aspx");
                }
            }

            //If tried to log in
            if (Request.Form["loginSubmit"] != null)
            {
                string username = Request.Form["loginUsername"];
                string password = Request.Form["loginPassword"];

                //select statement returns all the rows where both the username and password
                //are the exact same as the ones in the statement
                //(username is primary key so not more than 1 row)
                string statement = "SELECT * FROM " + tableName;
                statement += " WHERE username='" + username + "' AND password='" +password+ "'";

                //If username and password exist in database under one user (there are more
                //than 0 rows returned from statement)
                if (MyAdoHelper.IsExist(db, statement))
                {
                    //save username and redirect client to front page
                    Session["username"] = username;
                    Response.Redirect("frontPage.aspx");
                }
                else
                {
                    //Show error msg if username and password don't belong to one user
                    errMsg = "Username or password are wrong";
                }
            }
        }
    }
}