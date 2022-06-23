<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrontPage.aspx.cs" Inherits="NatWebProj.MyFiles.FrontPage" %>

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
    
    <!-- tables for different pages -->
    <table style="width:70%; color:navy; border:solid; float:left; text-align:center">
        <tr style="font-size:200%; color:dodgerblue;">
            <td style="color:blue; text-decoration:underline;">Main Page</td>
            <td style="color:dodgerblue;"> <a href="Page2.aspx">About Mars</a> </td>
            <td style="color:dodgerblue;"> <a href="Page3.aspx">Colonization</a> </td>
            <td> <a href="ChangePassword.aspx">Change Password</a> </td>
            <td id="manager" style="display:none" > <a href="Manager.aspx">Manager</a> </td>
        </tr>
    </table>
    <table style="width:9%; color:navy; border:solid; float:right; display:inline-block; text-align:center">
        <tr style="font-size:200%; text-align:center"> <td style="text-align:center"> <a href="Form.aspx">Log out</a> </td> </tr>
    </table>

    <br />
    <br />
    <!-- If came from signup/login then write welcome to user, otherwise just welcome -->
    <table align="center" style="width:100%">
        <tr>
            <td> <h1 style="text-align:center">Welcome <%=Session["username"] %> to Marsearch!</h1><br /> </td>
        </tr>
    </table>
    <h2 style="text-align:center;">This site contains top secret information about Mars and the plans to colonize it.<br />If you have any questions about Mars, you just might find their answers here!  <br /></h2>
    <h2 style="text-align:center;">You can find information about Mars, its colonization plans and more!</h2> <br />

    <!-- another background picture in the middle -->
    <div class="middle">
        <img src="../pictures/MarsNoBackground.png" alt="owned by designproject" width="220">
    </div>
</body>
</html>