<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<html>
<head>
    <meta http-equiv="Pragma" content="no-cache">
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-image: url("./frontend_pict/home.jpg");
            background-size: 100% 100%;
            background-repeat: no-repeat;
            background-color: black;
        }

        .nav {
            display: flex;
            justify-content: center;
            position: relative;
        }

        .nav a {
            position: relative;
            margin: 0 20px;
        }

        #go_button {
            width: 23%;
            height: 24%;
            position: absolute;
            top: 49.3%;
            left: 39.3%;
            /* background-color: paleturquoise; */
            cursor: pointer;
            background-image: none;
            background-size: 100% 100%;
            background-image: url("./frontend_pict/go3.png");
            opacity: 0;
            transition: opacity .3s ease-in-out;
        }

        #go_button:hover {
            opacity: 1;
        }

        #login_area {
            display: none;
            padding: 50px 55px;
            position: absolute;
            top: 25%;
            left: 40%;
            width: 300px;
            height: 400px;
            box-sizing: border-box;
            border-radius: 10px;
            background-color: rgba(46, 46, 46, 0.4);
        }

        .login_img {
            width: 80px;
            height: 80px;
            position: absolute;
            top: -8%;
            left: 38%;
        }

        h3 {
            margin: 0;
            padding: 0 0 20px;
            color: white;
            text-align: center;
        }

        .login_info p {
            margin: 0 0 5px 0;
            color: white;
        }

        .login_info input {
            width: 200px;
            margin-bottom: 10px;
            border: none;
        }

        .login_info input[type="text"],
        .login_info input[type="password"] {
            border: none;
            border-bottom: 1px solid white;
            background: transparent;
            outline: none;
            color: white;
            height: 30px;
        }

        .login_info input[type="text"]:focus,
        .login_info input[type="password"]:focus {
            border-bottom: 2px solid white;
        }

        .login_info input[type="submit"] {
            margin-top: 10px;
            cursor: pointer;
            border: none;
            outline: none;
            height: 40px;
            color: white;
            background-color: rgba(255, 107, 107, 1);
            border-radius: 20px;
        }

        .login_info input[type="submit"]:hover {
            transition: 0.5s;
            background-color: rgb(252, 64, 64);
        }

        .login_info a {
            color: white;
            text-decoration: none;
            text-align: center;
        }

        .login_info a:hover {
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div onclick="go_click()" id="go_button"></div>
    <div id="login_area">
    	<a href='register.jsp'><img class="login_img" src="./frontend_pict/pokemon.png"></a>
        <h3>Log In Here</h2>
        	<div style='color: rgb(255, 0, 0);'>${ requestScope.error }</div>
            <form class="login_info" method='post' action="login">
                <p>Name</p>
                <input type="text" name="username" autocomplete="off">
                <p>Password</p>
                <input type="password" name="password">
                <input type="submit" value="Sign In">
                <a href="forget.jsp">
                    <p>Change Password</p>
                </a>
            </form>
    </div>
</body>

<script>
    function go_click() {
        document.body.style.backgroundImage = 'url(./frontend_pict/login.jpg)'
        document.getElementById("go_button").style.display = "none"
        document.getElementById("login_area").style.display = "block"
    }
</script>

</html>