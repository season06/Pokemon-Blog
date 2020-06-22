<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta http-equiv="Pragma" content="no-cache">
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
</head>
<style>
@import url("https://fonts.googleapis.com/css?family=VT323");
    /*a442ff*/
    body {
    margin:0;
    padding:0;
    	width:100%;
    	height:100%;
        background-image: url("./frontend_pict/register.jpg");
        background-size: cover;
    }
    .regist{
        border: 2px solid white;
        border-radius: 20px;
        position: absolute;
        left:3%;
        top: 30%;
        width: 300px;
        height: 450px;
        padding: 20px;
        background: linear-gradient(270deg,rgba(203, 248, 255, 0.7),rgba(17, 83, 137, 0.7));
    }

    .regist h3{
        width: 100%;
        text-align: center;
        color: rgb(255, 255, 255);
    }
    
    .regist .row{
        width: 100%;
        margin: 35px 0 10px;
        transition: 0.5s;
    }

    .regist .inputBox{
        position: relative;
        width: 100%;
        height: 40px;
        color: rgb(255, 255, 255);
    }

    .regist .inputBox input{
        padding: 5px 10px;
        position: absolute;
        width: 100%;
        height: 100%;
        background:transparent;
        box-shadow: none;
        border: none;
        outline: none;
        z-index: 1;
        color: #6cc4ff;
    }

    .regist .inputBox .text{
        position: absolute;
        top: 0;
        left: 0;
        line-height: 35px;
        transition: 0.5s;
        padding: 0 10px;
        pointer-events: none;
    }

    .regist .inputBox input:focus + .text{
        top: -30px;
        left: -10px;
    }
    .regist .inputBox input:valid + .text{
        top: -30px;
        left: -10px;
    }

    .regist .inputBox .line{
        position: absolute;
        bottom: 0;
        display: block;
        width: 100%;
        height: 2px;
        background-color: rgb(255, 255, 255);
        transition: 0.5s;
        pointer-events: none;
    }

    .regist .inputBox input:focus ~ .line,
    .regist .inputBox input:valid ~ .line{
        height: 80%;
        border-radius: 3px;
    }

    input[type="submit"]{
        margin-top: 10px;
        width: 100%;
        height: 40px;
        border: none;
        cursor: pointer;
        outline: none;
        background-color: #6cc4ff;
        color: white;
        border-radius: 20px;
        transition: 0.3s;
    }

    input[type="submit"]:hover{
        background: #6cc4ff;
        color: white;
        box-shadow: 0 0 10px #6cc4ff,
                    0 0 25px #6cc4ff,
                    0 0 40px #6cc4ff;
    }
    
    .error{
     	position:absolute;
     	top:5%;
     	left:3%;
        margin: 0;
        width: 300px;
      	height: 150px;
        background-color: rgba(17, 83, 137, 0.7);
        border: white 2px solid;
        border-radius: 20px;
        padding: 10px;
        box-sizing: border-box;
    }
    .error .title{
    	position:relative;
        font-family: "VT323";
        padding: 0;
        margin: 0;
        font-size: 25px;
        text-align: center;
        color:white;
    }

    .error .discription{
        font-family: "VT323";
        padding: 0;
        margin: 0;
        font-size: 20px;
        text-align: justify;
        color:white;
    }
</style>

<body>
    <div class="box"></div>
    <% List<String> error = (List<String>) request.getAttribute("error");
			if(error != null) { %>
				<div class="error">
		        <p class="title">ERROR : regist fail</p>
				 <% for (String err : error) { %>
					 <p class="discription"><%= err %></p>
					 
		 <%}}%>
		 </div>
    <div class="regist">
        <h3>Register</h3>
        <form method='post' action='register'>
            <div class="row">
                <div class="inputBox">
                    <input type="text" name="username" required="required"  autocomplete="off">
                    <span class="text">Name</span>
                    <span class="line"></span>
                </div>
            </div>
            <div class="row">
                <div class="inputBox">
                    <input type="password" name="password" required="required">
                    <span class="text">Password</span>
                    <span class="line"></span>
                </div>
            </div>
            <div class="row">
                <div class="inputBox">
                    <input type="password" name="password2" required="required">
                    <span class="text">Confirm Password</span>
                    <span class="line"></span>
                </div>
            </div>
            <div class="row">
                <div class="inputBox">
                    <input type="email" name="email" required="required"  autocomplete="off">
                    <span class="text">Email</span>
                    <span class="line"></span>
                </div>
            </div>
            <input type="submit" value="Submit">
        </form>
    </div>
</body>

</html>