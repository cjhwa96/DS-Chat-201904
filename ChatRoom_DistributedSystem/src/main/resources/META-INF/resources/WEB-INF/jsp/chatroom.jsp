<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>CloudBond - Chat</title>
    <link rel="stylesheet" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="/css/generic2.css" />
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600" rel="stylesheet">
</head>
<body>
<noscript>
    <h2>Sorry! Your browser doesn't support Javascript</h2>
</noscript>
<header>
    <div class="logHeader2">
        <img src="/DSLOGO.png" alt="" class="CBlogo">
    </div>
</header>

<div id="username-page">
    <div class="username-page-container">
        <h1 class="title">Welcome ${username}</h1>
        <form id="usernameForm" name="usernameForm">
            <div class="form-group">
                <input type="text" id="name" style="display:none" value="${username}" autocomplete="off" class="form-control" />
            </div>
            <div class="form-group">
                <button type="submit" class="red username-submit">Start Chatting</button>
            </div>
        </form>
    </div>
</div>

<div id="chat-page" class="hidden">
    <div class="bgA">
        <div class="bgABlur">

        </div>
    </div>
    <div class="chat-container">
        <div class="chat-header">
            <h2>CloudBond Chat Room</h2>
        </div>
        <div class="connecting">
            Connecting...
        </div>
        <ul id="messageArea" style="background:inherit !important" class="style-2">

        </ul>
        <form id="messageForm" name="messageForm">
            <div class="form-group">
                <div class="input-group clearfix">
                    <input type="text" id="message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                    <button type="submit" class="white">Send</button>
                </div>
            </div>
        </form>
    </div>
</div>
<footer id="logFooter">
    <div class="footerWrapper">
        <div class="footer-social-list">
            <p>Copyright &copy; 2018-2019 CloudBond. All Rights Reserved.</p>
        </div>
    </div>
</footer>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="/js/main.js"></script>
</body>
</html>
