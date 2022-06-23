using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NatWebProj.MyFiles
{
    public partial class Manager : System.Web.UI.Page
    {
        public string usersList;
        public string regMsg;

        protected void Page_Load(object sender, EventArgs e)
        {
            string db = "Database.mdf";
            string tableName = "Users";

            //select statement returns all the rows in the table 'Users' in the database
            string selectQuery = "SELECT * FROM Users";

            if (Request.Form["delSubmit"] != null) //if delete button was pressed
            {
                string username = Request.Form["username"];
                //Delete statement deletes every row where the username is exactly the same
                //as the given username in the statement
                //(username is primary key so max of 1 user deleted)
                string statement = "DELETE FROM " + tableName + " WHERE username='" + username + "'";
                int deletedUsers = 0;
                deletedUsers = MyAdoHelper.RowsAffected(db, statement); //delete the user and return num of users deleted
                if (deletedUsers != 0)
                    regMsg = "User was deleted successfully";
                else //if 0 then none were found and deleted
                    regMsg = "No users matched that username";


            }

            //set it here after delete to make sure its the most updated table
            usersList = MyAdoHelper.printDataTable(db, selectQuery); //get table of users as string
        }
    }
}