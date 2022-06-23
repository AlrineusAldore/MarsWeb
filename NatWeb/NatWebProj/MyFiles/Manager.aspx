<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="NatWebProj.MyFiles.Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Marsearch</title>
    <link rel="stylesheet" type="text/css" href="css.css.css" />
    
    <script>
        //Function shows the manager tab if it's the manager who's logged in
        function checkManager()
        {
            var username = "<%=Session["username"] %>";

            //if username is manager, display the admin page
            if (username != null && username == "Manager")
                document.getElementById("manager").style.display = "inline";
            else //if it isn't, then hide the manager link
                document.getElementById("manager").style.display = "none";
        }

    </script>
</head>

<body onload="checkManager()">
    
    <!-- credit & website name -->
    <h6 style="color:white; text-align:right;">Image by Nasa</h6>
    <h1 style="text-align:center; font-size:300%; text-decoration:underline; color:brown">Marsearch</h1>

    <!-- table for normal links -->
    <table style="width:70%; color:navy; border:solid; float:left; text-align:center">
        <tr style="font-size:200%; color:white;">
            <td> <a href="FrontPage.aspx">Main Page</a> </td>
            <td> <a href="Page2.aspx">About Mars</a> </td>
            <td> <a href="Page3.aspx">Colonization</a></td>
            <td> <a href="ChangePassword.aspx">Change Password</a> </td>
            <td> <a style="color:blue; text-decoration:underline;">Manager</a> </td>
        </tr>
    </table>
    <!-- table for logout link -->
    <table style="width:9%; color:navy; border:solid; float:right; display:inline-block; text-align:center">
        <tr style="font-size:200%; text-align:center"> <td> <a href="Form.aspx">Log out</a> </td> </tr>
    </table>
    <br /> <br /> <br />

    <%=usersList %>

    <h1>Delete user by username</h1> <br />
    <form method="post" action="">
        Username to delete:
        <input type="text" id="username" name="username"/> <br /> <br />
        
        <table style="width:100%; text-align:center; display:inline-block;">
            <tr style="text-align:center">
                <td> <input type="submit" id="delSubmit" name="delSubmit" value="delete"/> </td>
            </tr>
        </table>
    </form>
    <br /> <%=regMsg %>
</body>
</html>
