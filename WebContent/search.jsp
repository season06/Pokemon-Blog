<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, cc.openhome.model.Pokemon"%>
<html>
<head>
    <meta http-equiv="Pragma" content="no-cache">
    <title>Search</title>
    <style>
        @import url("https://fonts.googleapis.com/css?family=Kumar%20One%20Outline");

        @font-face {
            font-family: "WaWa Ti";
            src: url("./frontend_pict/font.ttc");
        }

        body {
            background-color: #1e2128;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        .logo {
            margin-top: 20px;
            margin-left: 20px;
            font-family: "Kumar One Outline";
        }

        .logo a {
            margin: 0;
            padding: 0;
            font-size: 70px;
            text-decoration: none;
        }

        .logo a span {
            display: table-cell;
            white-space: pre;
            animation: animate 2s linear;
            background: transparent;

            color: #fff;
            text-shadow: 0 0 10px #ffe600,
                0 0 10px #ffe600,
                0 0 20px #ffe600,
                0 0 40px #ffe600,
                0 0 80px #ffe600,
                0 0 120px #ffe600,
                0 0 200px #ffe600,
                0 0 300px #ffe600;
        }

        .logo a span:nth-child(1) {
            animation-delay: 0s;
        }

        .logo a span:nth-child(2) {
            animation-delay: 0.25s;
        }

        .logo a span:nth-child(3) {
            animation-delay: 0.5s;
        }

        .logo a span:nth-child(4) {
            animation-delay: 0.75s;
        }

        .logo a span:nth-child(5) {
            animation-delay: 1s;
        }

        .logo a span:nth-child(6) {
            animation-delay: 1.25s;
        }

        .logo a span:nth-child(7) {
            animation-delay: 1.5s;
        }

        .logo a span:nth-child(8) {
            animation-delay: 1.75s;
        }

        .logo a span:nth-child(9) {
            animation-delay: 2s;
        }

        @keyframes animate {

            0%,
            100% {
                olor: #fff;
                text-shadow: 0 0 10px #ffe600,
                    0 0 10px #ffe600,
                    0 0 20px #ffe600,
                    0 0 40px #ffe600,
                    0 0 80px #ffe600,
                    0 0 120px #ffe600,
                    0 0 200px #ffe600,
                    0 0 300px #ffe600,
                    0 0 400px #ffe600;
            }

            5%,
            95% {
                color: rgb(0, 0, 0);
                text-shadow: none;
            }
        }

        @import url("./frontend_pict/font.ttc");

        .main {
            position:absolute;
            top:20%;
            /* background: red; */
            width: 100%;
            height: 650px;
            align-items: center;
            margin: 0;
            padding: 0;
        }

        .main .square {
            /* background: orange; */
            position: relative;
            width: 500px;
            height: 500px;
            margin: auto;
            box-sizing: border-box;
            cursor: pointer;
        }

        .main .square .animate:nth-child(1) {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: 2px white solid;
            border-radius: 66% 34% 44% 56% / 36% 39% 61% 64%;
            transition: 0.5s;
            animation: rotate 2s linear infinite;
            z-index: -1;
        }

        .main .square:hover .animate:nth-child(1) {
            border: none;
            background-color: rgba(255, 230, 0, .3);
        }

        .main .square .animate:nth-child(2) {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: 2px white solid;
            /* border-radius: 46% 54% 61% 39% / 73% 47% 53% 27%; */
            border-radius: 66% 34% 44% 56% / 36% 39% 61% 64%;
            animation: rotate 4s linear infinite;
            z-index: -1;
        }

        .main .square:hover .animate:nth-child(2) {
            border: none;
            background-color: rgba(255, 230, 0, .3);
        }

        .main .square .animate:nth-child(3) {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: 2px white solid;
            /* border-radius: 35% 65% 37% 63% / 62% 55% 45% 38%; */
            border-radius: 66% 34% 44% 56% / 36% 39% 61% 64%;
            animation: rotate2 6s linear infinite;
            z-index: -1;
        }

        .main .square:hover .animate:nth-child(3) {
            border: none;
            background-color: rgba(255, 230, 0, .3);
        }

        @keyframes rotate {
            from {
                transform: rotate(0deg);
            }

            to {
                transform: rotate(360deg);
            }
        }

        @keyframes rotate2 {
            from {
                transform: rotate(360deg);
            }

            to {
                transform: rotate(0deg);
            }
        }

        .main .square .content {
            box-sizing: border-box;
            padding-top: 70px;
            text-align: center;
            /* background: green; */
            width: 500px;
            height: 500px;
            transition: 0.5s;
            z-index: 1000;
        }

        .main .square .content img {
            /* background: blue; */
            width: 300px;
        }

        .main .square .content p {
            text-align: center;
            padding: 0;
            margin: 0;
            color: white;
            font-family: "WaWa Ti";
            font-size: 30px;
        }

        .message {
            position: relative;
            left: 95px;
            border: 0;
            outline: none;
            width: 300px;
            height: 50px;
            resize: none;
            border-radius: 10px;
            padding: 5px;
            background: transparent;
            border: white solid 2px;
            color: white;
        }

        .submit {
            position: relative;
            top: -30px;
            left: 130px;
            border: none;
            background: transparent;
            outline: none;
            cursor: pointer;
            font-weight: bold;
            color: #ffe600;
        }

        .searchInput {
            box-sizing: border-box;
            position: absolute;
            top: 50px;
            right: 30px;
            margin: 0;
            padding: 0;
            width: 400px;
            height: 50px;
            background: transparent;
            border-radius: 0 30px 0 30px;
            border: 3px solid white;
            outline: none;
            color: white;
            padding-left: 20px;
            font-size: 20px;
            font-family: "Microsoft JhengHei";
        }

        .searchInput:focus {
            transition: 0.3s;
            box-shadow: 0 0 10px white,
                0 0 20px white;
        }

        .searchSubmit {
            position: absolute;
            top: 60px;
            right: 50px;
            width: 30px;
            height: 30px;
            background: transparent;
            border-radius: 10px;
            border: none;
            outline: none;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <div class="logo">
        <a href="./blog">
            <span><</span>
            <span>M</span>
            <span>y</span>
            <span> </span>
            <span>B</span>
            <span>l</span>
            <span>o</span>
            <span>g</span>
            <span>></span>
        </a>
    </div>
    <form method="get" action="search">
        <input class="searchInput" type="text" name="a_poke" autocomplete="off">
        <button class="searchSubmit" type="submit" value=""><span>
            <svg style="color: white;" xmlns="http://www.w3.org/2000/svg"
                width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"
                stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
            </svg>
        </span></button>
        
    </form>
	<% Pokemon poke = (Pokemon) request.getAttribute("pokemon"); %>
    <div class="main">
        <div class="square">
            <span class="animate"></span>
            <span class="animate"></span>
            <span class="animate"></span>
            <span class="animate"></span>
            <div class="content">
                <p><span><%= poke.getID() %> </span><span><%= poke.getName() %> </span><span><%= poke.getAttribute() %></span></p>
                <img src=<%= poke.getPicture() %> alt="">
                <br>
                <%
				    List<String> error = (List<String>) request.getAttribute("error");
				    if(error != null) {
				        for (String err : error) {%>
				        	<%=err%>
				    <%}}
				%>
                <form method="post" action="new_message">
                    <textarea class="message" name="txt" cols="30" rows="10">${param.txt}</textarea>
                    <input style="visibility:hidden" type="text" name='poke_id' value=<%= poke.getID() %>>
                    <input class="submit" type="submit" value="Send">
                </form>
            </div>
        </div>
    </div>
</body>

</html>