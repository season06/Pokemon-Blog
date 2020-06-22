<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*,cc.openhome.model.Blog" %>
<!DOCTYPE html>
<html>

<head>
    <title>BLOG</title>

    <style>
        body {
            background-color: #1e2128;
            /* background-color: #070044; */
            margin: 0;
            padding: 0;
        }

        .logo {
            padding: 0;
            margin: 0;
            width: 90px;
            height: 17px;
            background-color: yellow;
            color: black;
            position: absolute;
            left: 45%;
            top: 0;
            background: transparent;
        }

        .logo a {
            font-size: 30px;
            margin: 0;
            padding: 0;
            text-decoration: none;
        }

        .logo a::after {
            border-right: 2px white solid;
            margin: 0;
            padding: 0;
            color: white;
            animation: anim 3s, cursor 800ms steps(10) infinite;
            overflow: hidden;
            white-space: nowrap;
            font-family: 'Anonymous Pro', monospace;
            content: 'Pokemon Go ';
        }

        @keyframes anim {
            0% {
                content: "";
            }

            20% {
                content: "";
            }

            30% {
                content: "P";
            }

            36% {
                content: "Po";
            }

            42% {
                content: "Pok";
            }

            48% {
                content: "Poke";
            }

            54% {
                content: "Pokem";
            }

            60% {
                content: "Pokemo";
            }

            66% {
                content: "Pokemon";
            }

            72% {
                content: "Pokemon ";
            }

            82% {
                content: "Pokemon G";
            }

            90% {
                content: "Pokemon G";
            }

            100% {
                content: "Pokemon Go";
            }
        }

        @keyframes cursor {
            from {
                border-right: 2px solid rgba(0, 255, 0, .75);
            }

            to {
                border-right: transparent;
            }
        }

        .head {
            width: 100%;
            height: 700px;
            background-size: 100%;
            background-image: url("./frontend_pict/blog8.png");
            background-repeat: no-repeat;
            z-index: -1;
        }

        .head_pic {
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }

        .searchBox {
            padding: 0;
            margin: 0;
            position: absolute;
            top: 11%;
            left: 49%;
            height: 40px;
            width: 40px;
            background: rgb(173, 173, 173);
            border-radius: 25px;
            text-align: center;
            display: table;
            border: 3px solid rgb(221, 221, 221);
            cursor: pointer;
            vertical-align: middle;
        }

        .searchBox:hover {
            transition: 0.5s;
            box-shadow: 0 0 10px rgb(221, 221, 221),
                0 0 20px rgb(221, 221, 221);
        }

        .welcome {
            background: transparent;
            position: absolute;
            top: 58%;
            right: 0%;
            width: 300px;
            height: 125px;
        }

        .welcome p {
            height: 90px;
            float: right;
            margin: 0;
            padding: 0 10px;
            color: transparent;
            font-family: 'Copperplate', fantasy;
            font-size: 90px;
            -webkit-text-stroke: 1px #eee;
            cursor: default;
        }

        .yourPicture {
            padding: 0 10px;
            position: absolute;
            float: left;
            top: 55%;
            font-family: 'Copperplate', fantasy;
            font-size: 90px;
            color: #9c9c9c;
            mix-blend-mode: screen;
            cursor: default;
            z-index:100;
        }

        .main {
            position: relative;
            width: 70%;
            height: 300px;
            /* border: white solid 2px; */
            background: transparent;
            box-sizing: border-box;
            margin: auto;
            margin-bottom: 30px;
            overflow: hidden;
        }

        .main_pic {
            float: left;
            height: 300px;

        }

        .message {
            float: left;
            color: white;
            padding: 30px 0 0 0;
        }

        .message button {
            float: left;
            margin-top: 2px;
            margin-right: 20px;
        }

        .message p {
            font-family: "Papyrus", fantasy;
            font-size: medium;
            margin: 0;
            float: left;
        }

        .message span {
            padding-left: 10px;
            font-family: "Papyrus", fantasy;
            font-size: small;
            font-weight: 100;
        }

        .main .animate:nth-child(1) {
            filter: blur(1px);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, rgba(255, 255, 255, 0), #ffe600);
            animation: animate1 1s linear infinite;
            box-shadow: 0 0 10px #ffe600;
        }

        @keyframes animate1 {
            0% {
                transform: translateX(-100%);
            }

            100% {
                transform: translateX(100%);
            }
        }

        .main .animate:nth-child(2) {
            position: absolute;
            filter: blur(1px);
            top: 0;
            right: 0;
            width: 3px;
            height: 100%;
            background: linear-gradient(180deg, rgba(255, 255, 255, 0), #ffe600);
            animation: animate2 1s linear infinite;
            animation-delay: 0.5s;
            box-shadow: 0 0 10px #ffe600;
        }

        @keyframes animate2 {
            0% {
                transform: translateY(-100%);
            }

            100% {
                transform: translateY(100%);
            }
        }

        .main .animate:nth-child(3) {
            position: absolute;
            filter: blur(1px);
            bottom: 0;
            right: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(270deg, rgba(255, 255, 255, 0), #ffe600);
            animation: animate3 1s linear infinite;
            box-shadow: 0 0 10px #ffe600;
        }

        @keyframes animate3 {
            0% {
                transform: translateX(100%);
            }

            100% {
                transform: translateX(-100%);
            }
        }

        .main .animate:nth-child(4) {
            position: absolute;
            filter: blur(1px);
            top: 0;
            left: 0;
            width: 3px;
            height: 100%;
            background: linear-gradient(0deg, rgba(255, 255, 255, 0), #ffe600);
            animation: animate4 1s linear infinite;
            animation-delay: 0.5s;
            box-shadow: 0 0 10px #ffe600;
        }

        @keyframes animate4 {
            0% {
                transform: translateY(100%);
            }

            100% {
                transform: translateY(-100%);
            }
        }

        .deleteButton{
            position: relative;
            top: 2px;
            height: 20px;
            width: 20px;
            border: none;
            outline: none;
            background: transparent;
            cursor: pointer;
            border-radius: 50%;
        }

        .deleteButton:hover{
            transition: .4s;
            background-color: rgba(255, 255, 255, 0.781);
            box-shadow: 0 0 10px white,
            0 0 20px white;
        }
        
        .online_user{
	        width:30px;
	        height:30px;
	        border-radius:15px;
	        background:grey;
	        position:absolute;
	        top:30px;
	        right:10px;
	        z-index:200;
        	color:white;
        	text-align:center;
        	vertical-align:middle;
        	font-family:"Arial";
        	animation: shin 2s infinite;
        }
        .online_user p{
	        margin:0;
	        padding:0;
        	position:relative;
        	top:4px;
        }
        
        @keyframes shin{
        	form{
        		box-shadow:0 0 20px yellow,
			        		0 0 40px yellow,
			        		0 0 60px yellow;
        	}
        	to{
	        	box-shadow:0 0 20px yellow,
			        		0 0 40px yellow,
			        		0 0 60px yellow;
	        }
        }
    </style>
</head>

<body>
    <div class="head"></div>
    <img class="head_pic" src="./frontend_pict/blog7.png" alt="">
    <div class="logo">
        <br><a href='logout'></a>
    </div>
    <a href="./search.jsp" class="searchBox">
        <svg style="position: absolute; top: 10px; left: 10px; color: rgb(221, 221, 221);"
            xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
            class="feather feather-search">
            <circle cx="11" cy="11" r="8"></circle>
            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
        </svg>
    </a>
   	<div class="online_user">
		<p><%= request.getAttribute("online") %></p>
	</div>
	
    <div class="welcome">
        <p>WELCOME</p>
        <p><%= request.getAttribute("username") %></p>
    </div>
    <p class="yourPicture">YOUR MESSAGE</p>

	<% List<Blog> blog = (List<Blog>) request.getAttribute("blog");%>
	<% for(Blog info: blog) { %>
    <div class="main">
        <span class="animate"></span>
        <span class="animate"></span>
        <span class="animate"></span>
        <span class="animate"></span>
        <img class="main_pic" src=<%= info.getPokemon() %> alt="">
        <div class="message">
            <form action="del_message">
                <button name="delete" value=<%= info.getID() %> class="deleteButton">
                    <svg style="color: white; position: relative; left: -3px; top: 1px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-x">
                        <line x1="18" y1="6" x2="6" y2="18"></line>
                        <line x1="6" y1="6" x2="18" y2="18"></line>
                    </svg>
                </button>
                <p><%= info.getTxt() %><span><%= info.getTime() %></span></p>
            </form>
        </div>
    </div>
     <% } %>
</body>


<script>
    var img_posi = document.getElementsByClassName("head_pic")[0];
    var mess = document.getElementsByClassName("yourPicture")[0];
    var mess_top = mess.style.top
    window.addEventListener('scroll', function () {
        var top = window.pageYOffset;
        console.log(top);
        img_posi.style.top = (-0.2 * top) + "px";
        if (top > 480) {
            mess.style.top = top - 100 + "px"
            mess.style.mixBlendMode = "normal";
            mess.style.color = "rgba(255,255,255,0.8)"
        } else {
            mess.style.top = mess_top;
            mess.style.mixBlendMode = "screen";
            mess.style.color = "#9c9c9c"
        }
    });
</script>
</html>