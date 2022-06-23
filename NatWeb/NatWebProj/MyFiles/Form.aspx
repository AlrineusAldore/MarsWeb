<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="Proj.Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Marsearch</title>
    <link rel="stylesheet" type="text/css" href="css.css.css" />

    <script>
        //Returns true if username has at least 2 letters, or false otherwise
        function checkSignupUsername()
        {
            var name = document.signup.signupUsername.value;
            
            if (name.length < 2)
            {
                document.getElementById("signupUsernameError").style.display = "inline";
                return false;
            }

            document.getElementById("signupUsernameError").style.display = "none";
            return true;
        }

        //Returns true if username has at least 2 letters, or false otherwise
        function checkLoginUsername()
        {
            var name = document.login.loginUsername.value;

            if (name.length < 2) {
                document.getElementById("loginUsernameError").style.display = "inline";
                return false;
            }

            document.getElementById("loginUsernameError").style.display = "none";
            return true;
        }

        //Returns false if password has less than 2 characters or doesn't have a digit, otherwise returns true
        function checkSignupPassword()
        {
            var password = document.signup.signupPassword.value;

            var tooShort = false;
            var noDigit = true;

            if (password.length < 2)
                tooShort = true;

            //check if there's at least 1 digit in password
            for (var i = 0; i < password.length && noDigit; i++)
            {
                if (password[i] >= '0' && password[i] <= '9')
                    noDigit = false;
            }

            if (tooShort || noDigit)
            {
                document.getElementById("signupPasswordError").style.display = "inline";
                return false;
            }

            document.getElementById("signupPasswordError").style.display = "none";
            return true;
        }

        //Returns false if password has less than 2 characters or doesn't have a digit, otherwise returns true
        function checkLoginPassword() {
            var password = document.login.loginPassword.value;

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
                document.getElementById("loginPasswordError").style.display = "inline";
                return false;
            }

            document.getElementById("loginPasswordError").style.display = "none";
            return true;
        }

        //Returns false if email is invalid, otherwise true
        function checkEmail()
        {
            var email = document.signup.email.value;
            var invalid = false;

            //if there are no ats or dots
            if (email.indexOf('@') == -1 || email.indexOf('.') == -1)
                invalid = true;
            //if there are multiple ats
            else if (email.indexOf('@') != email.lastIndexOf('@'))
                invalid = true;
            //if the email's username, mail server, or top-level domain are empty
            else if (email.indexOf('@') == 0 || email.indexOf('@') >= email.indexOf('.') - 1 || email.lastIndexOf('.') == email.length - 1)
                invalid = true;

            if (invalid)
            {
                document.getElementById("emailError").style.display = "inline";
                return false;
            }

            document.getElementById("emailError").style.display = "none";
            return true;
        }

        //Returns false if gender wasn't selected, otherwise true
        function checkGender()
        {
            var gender = document.signup.gender.value;

            if (gender.length == 0) {
                document.getElementById("genderError").style.display = "inline";
                return false;
            }

            document.getElementById("genderError").style.display = "none";
            return true;
        }

        //checks every condition and returns true if every condition returns true
        function checkSignup()
        {
            //pass true as parameter since its signup
            var nameFlag = checkSignupUsername();
            var passFlag = checkSignupPassword();
            var emailFlag = checkEmail();
            var genderFlag = checkGender();

            if (nameFlag && passFlag && emailFlag && genderFlag)
                return true;

            return false;
        }

        //Checks if every login input (username & password) is valid and returns the result
        function checkLogin()
        {
            //pass false as parameter since its login
            var nameFlag = checkLoginUsername();
            var passFlag = checkLoginPassword();

            if (nameFlag && passFlag)
                return true;

            return false;
        }

    </script>
</head>

<!--  -->
<body>

    <!-- credit & website name -->
    <h6 style="color:white; text-align:right;">Image by Nasa</h6>
    <h1 style="text-align:center; font-size:300%; text-decoration:underline; color:brown">Marsearch</h1>

    <br />

    <!-- put the two forms here to make them side by side -->
    <div style="width:50%; margin:auto">

    <div style="display:inline-block; width:45%; text-align:center">
    <!-- signup form -->
        <form name="signup" style="text-align:center; display:inline;" method="post" action="" onsubmit="return checkSignup();">
            <p style="font-size:230%; text-decoration:underline;">Sign Up!</p> <br />
            <table border="0" style="align-content:center" align="center">

                <!-- username -->
                <tr>
                    <td>Username:</td>
                </tr>
                <tr>
                    <td><input type="text" name="signupUsername" id="signupUsername" maxlength="20" oninput="checkSignupUsername()" /></td>
                </tr>
                <tr>
                    <td><span id="signupUsernameError" style="display:none; color:red;"> Name must contain at least 2 characters </span></td>
                </tr>
                <tr></tr>

                <!-- password -->
                <tr>
                    <td>Password:</td>
                </tr>
                <tr>
                    <td><input type="password" name="signupPassword" maxlength="30" oninput="checkSignupPassword()"/></td>
                </tr>
                <tr>
                    <td><span id="signupPasswordError" style="display:none; font-size:smaller; color:red;"> Password must contain at least 2 characters and a digit </span></td>
                </tr>
                <tr></tr>
            
                <!-- email -->
                <tr>
                    <td>Email:</td>
                </tr>
                <tr>
                    <td><input type="text" name="email" maxlength="40" /></td>
                </tr>
                <tr>
                    <td><span id="emailError" style="display:none; font-size:smaller; color:red;"> Invalid email </span></td>
                </tr>
                <tr></tr> <tr></tr>
            
                <!-- gender -->
                <tr>
                    <td>Gender:</td>
                </tr>
                <tr>
                    <td> <input type="radio" name="gender" value="male" /> Male
                    <input type="radio" name="gender" value="female" /> Female
                    <input type="radio" name="gender" value="helicopter" /> Attack Helicopter </td>
                </tr>
                <tr>
                    <td><span id="genderError" style="display:none; font-size:smaller; color:red;"> pls choose gender ty </span></td>
                </tr>
                <tr></tr> <tr></tr> <tr></tr>
            
                <!-- interests (checkbox) -->
                <tr>
                    <td>What would you like seeing more on this website?:</td>
                </tr>
                <tr>
                    <td> <input type="checkbox" name="content" value="Terraforming" /> Terraforming </td>
                </tr>
                <tr>
                    <td> <input type="checkbox" name="content" value="Elon Musk and colonizing" /> Elon Musk and conolizing </td>
                </tr>
                <tr>
                    <td> <input type="checkbox" name="content" value="Random facts" /> Random facts </td>
                </tr>
                <tr></tr> <tr></tr> <tr></tr> <tr></tr>

                <!-- submit & reset -->
                <tr>
                    <td> <input type="submit" name="signupSubmit" id="signupSubmit" value="Submit" />  
                    <input type="reset" name="signupReset" value="Reset" /> </td>
                </tr>
            
            </table>
        </form>
    </div>
    
    <!-- login form -->
    <div style="display:inline-block; width:45%; text-align:center">
        <form name="login" style="text-align:center; display:inline" method="post" action="" onsubmit="return checkLogin();">
            <p style="font-size:230%; text-decoration:underline;">Login!</p> <br />
            <table border="0" style="align-content:center" align="center">

                <!-- username -->
                <tr>
                    <td>Username:</td>
                </tr>
                <tr>
                    <td><input type="text" name="loginUsername" id="loginUsername" maxlength="20" oninput="checkLoginUsername()"/></td>
                </tr>
                <tr>
                    <td><span id="loginUsernameError" style="display:none; color:red;"> Name must contain at least 2 characters </span></td>
                </tr>
                <tr></tr>

                <!-- password -->
                <tr>
                    <td>Password:</td>
                </tr>
                <tr>
                    <td><input type="password" name="loginPassword" maxlength="30" oninput="checkLoginPassword()"/></td>
                </tr>
                <tr>
                    <td><span id="loginPasswordError" style="display:none; font-size:smaller; color:red;"> Password must contain at least 2 characters and a digit </span></td>
                </tr>
                <tr></tr> <tr></tr> <tr></tr> <tr></tr>

                <!-- submit & reset -->
                <tr>
                    <td> <input type="submit" name="loginSubmit" id="loginSubmit" value="Submit" />  
                    <input type="reset" name="loginReset" value="Reset" /> </td>
                </tr>
            </table>
        </form>
    </div>
    
    </div>
    
    <!-- show error message -->
    <table align="center">
        <tr>
            <td> <%=errMsg %> </td>
        </tr>
    </table>

</body>
</html>