<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Proj.MyFiles.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Marsearch</title>
    <link rel="stylesheet" type="text/css" href="css.css.css" />

    <script>
        //Returns false if password has less than 2 characters or doesn't have a digit, otherwise returns true
        function checkPassword() {
            var password = document.changePassword.newPassword.value;
            var tooShort = false;
            var noDigit = true;

            if (password.length < 2)
                tooShort = true;

            //check if there's at least 1 digit in password
            for (var i = 0; i < password.length && noDigit; i++) {
                if (password[i] >= '0' && password[i] <= '9')
                    noDigit = false;
            }

            if (tooShort || noDigit) {
                document.getElementById("passwordErr").style.display = "inline";
                return false;
            }

            document.getElementById("passwordErr").style.display = "none";
            return true;
        }

        //Function shows the manager tab if it's the manager who's logged in
        function checkManager() {
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

    <!-- tables for different pages -->
    <table style="width:70%; color:navy; border:solid; float:left; text-align:center">
        <tr style="font-size:200%;">
            <td> <a href="FrontPage.aspx">Main Page</a> </td>
            <td> <a href="Page2.aspx">About Mars</a> </td>
            <td> <a href="Page3.aspx">Colonization</a> </td>
            <td style="text-decoration:underline; color:blue;"> Change Password </td>
            <td id="manager" style="display:none" > <a href="Manager.aspx">Manager</a> </td>
        </tr>
    </table>
    <table style="width:9%; color:navy; border:solid; float:right; display:inline-block; text-align:center">
        <tr style="font-size:200%; text-align:center"> <td> <a href="Form.aspx">Log out</a> </td> </tr>
    </table>
    <br /> <br /> <br /> <br />

    <form name="changePassword" method="post" onsubmit="return checkPassword();" action="">
        Input username:
        <input type="text" name="username" id="username"/>
        <br />
        Input current password:
        <input type="password" name="oldPassword" id="oldPassword"/>
        <br />
        Input new password:
        <input type="password" name="newPassword" id="newPassword"/>
        <span id="passwordErr" style="display:none; font-size:smaller; color:red;"> New password must contain at least 2 characters and a digit </span>
        <br />
        <input type="submit" name="changePassSubmit" id="changePassSubmit" value="update"/>
    </form>
    <%=errMsg %>
</body>
</html>
