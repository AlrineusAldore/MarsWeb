<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page3.aspx.cs" Inherits="NatWebProj.MyFiles.Page3" %>

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
            <td style="text-decoration:underline; color:blue;">Colonization</td>
            <td> <a href="ChangePassword.aspx">Change Password</a> </td>
            <td id="manager" style="display:none" > <a href="Manager.aspx">Manager</a> </td>
        </tr>
    </table>
    <!-- table for logout link -->
    <table style="width:9%; color:navy; border:solid; float:right; display:inline-block; text-align:center">
        <tr style="font-size:200%; text-align:center"> <td> <a href="Form.aspx">Log out</a> </td> </tr>
    </table>
    <br /> <br /> <br />

    <h3>For a long time, people talked about colonizing Mars, and they theorized how can they make Mars a livable planet.</h3><br />
    <h3>The most common theory on how to terraform Mars is to nuke it. Mars's temperature is too cold and its atmosphere is too thin.</h3>
    <h3>By nuking Mars, we send a lot of heat to it to make it warmer permanantly. To make its atmosphere thicker, an efficient way is to add carbon dioxide to it.</h3>
    <h3>While there isn't much carbon dioxide in its air, Mars's poles both have solid carbon dioxide, which will melt and go to the atmosphere if we nuke it.</h3>
    <h3>Making the atmosphere thicker will trap the heat and warm Mars up, as well as will make the pressure higher which is essential for us as the pressure on Mars is too low.</h3> <br />
    <h3>There are other ways to terraform Mars into a more livable planet. One of the plans is to find and fling a few dozen ammonia ice asteroids at the surface of Mars.</h3>
    <h3>That would vaporize materials with the enormous impacts thus adding them to the atmosphere, it will heat up Mars, and will add the ammonia into the atmosphere, which is a powerful greenhouse gas.</h3>
    <h3>Some even suggested building giant mirrors in space to reflect the rays of the sun into Mars and vaporize the ice poles and free them into the atmosphere.</h3> <br />
    <h3>Of course, all of those plans have flaws and are not as simple as they sound, which is what preventing us from initiating them.</h3>
</body>
</html>
