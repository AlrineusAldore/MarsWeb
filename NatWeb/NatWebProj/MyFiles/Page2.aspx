<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page2.aspx.cs" Inherits="NatWebProj.MyFiles.Page2" %>

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
            <td> <a href="FrontPage.aspx">Main Page</a> </td>
            <td style="text-decoration:underline; color:blue;">About Mars</td>
            <td> <a href="Page3.aspx">Colonization</a> </td>
            <td> <a href="ChangePassword.aspx">Change Password</a> </td>
            <td id="manager" style="display:none" > <a href="Manager.aspx">Manager</a> </td>
        </tr>
    </table>
    <table style="width:9%; color:navy; border:solid; float:right; display:inline-block; text-align:center">
        <tr style="font-size:200%; text-align:center"> <td> <a href="Form.aspx">Log out</a> </td> </tr>
    </table>
    <br /> <br /> <br />

    <h2>Mars is the fourth planet away from the sun in our solar system, right after Earth. From afar, it looks like a red planet. But on a close-up it has more of a golden-brown color.<br /></h2>
    <h2>Its atmosphere is 100 times thinner than that of the Earth, and consists of about:<br /></h2>
    <ul style="list-style-type:disc; font-size:140%;">
        <li>95% carbon dioxide</li>
        <li>2.7% nitrogen</li>
        <li>1.6% argon</li>
        <li>0.13% oxygen</li>
        <li>And minor amounts of: Carbon monoxide, water, nitrogen oxide, neon, hydrogen-deuterium-oxygen, krypton and xenon</li>
    </ul>
    <h2>The planet is named after Mars, the Roman god of war. Even though it has only 15% of the Earth’s volume and over 10% of the Earth’s mass, Mars only has about 37% of the Earth's gravity. <br /></h2>
    <h2>In the past, Mars had flowing liquid water on it, but now all it has is frozen water.</h2>
</body>
</html>
