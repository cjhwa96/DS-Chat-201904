'use strict';

var usernamePage = document.querySelector('#username-page');
var chatPage = document.querySelector('#chat-page');
var usernameForm = document.querySelector('#usernameForm');
var messageForm = document.querySelector('#messageForm');
var messageInput = document.querySelector('#message');
var messageArea = document.querySelector('#messageArea');
var connectingElement = document.querySelector('.connecting');

var stompClient = null;
var username = null;

var colors = [
    '#2196F3', '#32c787', '#00BCD4', '#ff5652',
    '#ffc107', '#ff85af', '#FF9800', '#39bbb0'
];

function connect(event) {
    username = document.querySelector('#name').value.trim();

    if(username) {
        usernamePage.classList.add('hidden');
        chatPage.classList.remove('hidden');

        var socket = new SockJS('/ws');
        stompClient = Stomp.over(socket);

        stompClient.connect({}, onConnected, onError);
    }
    event.preventDefault();
}


function onConnected() {
    // Subscribe to the Public Topic
    stompClient.subscribe('/topic/public', onMessageReceived);

    // Tell your username to the server
    stompClient.send("/app/chat.addUser",
        {},
        JSON.stringify({sender: username, type: 'JOIN'})
    )

    connectingElement.classList.add('hidden');
}


function onError(error) {
    connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
    connectingElement.style.color = 'red';
}


function sendMessage(event) {
    var messageContent = messageInput.value.trim();
    if(messageContent && stompClient) {
        var chatMessage = {
            sender: username,
            content: messageInput.value,
            type: 'CHAT'
        };
        stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(chatMessage));
        messageInput.value = '';
    }
    event.preventDefault();
}


function onMessageReceived(payload) {
    var message = JSON.parse(payload.body);

    var messageElement = document.createElement('li');

    if(message.type === 'JOIN') {
        messageElement.classList.add('event-message');
        message.content = message.sender + ' joined!';
    } else if (message.type === 'LEAVE') {
        messageElement.classList.add('event-message');
        message.content = message.sender + ' left!';
    } else {
        messageElement.classList.add('chat-message');

        var avatarElement = document.createElement('i');
        var avatarText = document.createTextNode(message.sender[0]);
        avatarElement.appendChild(avatarText);
        avatarElement.style['background-color'] = getAvatarColor(message.sender);

        messageElement.appendChild(avatarElement);

        var usernameElement = document.createElement('span');
        var usernameText = document.createTextNode(message.sender);
        usernameElement.appendChild(usernameText);
        messageElement.appendChild(usernameElement);
    }

    var textElement = document.createElement('p');
    var messageText = document.createTextNode(message.content);
    textElement.appendChild(messageText);

    messageElement.appendChild(textElement);

    messageArea.appendChild(messageElement);
    messageArea.scrollTop = messageArea.scrollHeight;
}


function getAvatarColor(messageSender) {
    var hash = 0;
    for (var i = 0; i < messageSender.length; i++) {
        hash = 31 * hash + messageSender.charCodeAt(i);
    }
    var index = Math.abs(hash % colors.length);
    return colors[index];
}

function test(){
    var node = document.createElement('li');
    node.classList.add('event-message');
    var textnode = document.createTextNode("I left!");
    node.appendChild(textnode);
    document.getElementById("messageArea").appendChild(node);
}
usernameForm.addEventListener('submit', connect, true)
messageForm.addEventListener('submit', sendMessage, true)

// show homepage nav bar
var i = 0;

function showNav(){

    if(i % 2 == 0){
        document.getElementById("hidden").style.visibility = "visible";
    }
    else{
        document.getElementById("hidden").style.visibility = "hidden";
    }

    i++;
}

var i = 0;

function showNav2(){

    if(i % 2 == 0){
        document.getElementById("hide").classList.remove("hidden");
    }
    else{
        document.getElementById("hide").classList.add("hidden");
    }

    i++;
}

function showPop(){
    var logIn = document.getElementById("signIn");
    var sigUp = document.getElementById("signUp");
    var logTrue = 0;

    if (logTrue != 1) {
        sigUp.style.display='none';
        logIn.style.display='grid';
        logTrue = 1;
    }
    else {
        logIn.style.display='none';
        logTrue = 0;
    }
}



function showPop2(){
    // var logIn = document.getElementById("signIn");
    var sigUp = document.getElementById("signUp");
    //var logFalse = 0;

    // if (logFalse != 1) {
    // //  logIn.style.display='none';
    //   sigUp.style.display='grid';
    //   logFalse = 1;
    // }
    // else if (logFalse == 1){
    //   sigUp.style.display='none';
    //   logFalse = 0;
    // }

    if (sigUp.style.display === "none") {
        sigUp.style.display = "grid";
    } else {
        sigUp.style.display = "none";
    }
}


function showPass(){
    var x = document.getElementById("Pass");
    var y = document.getElementById("pass2");
    var z = document.getElementById("pass3");

    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
    if (y.type === "password") {
        y.type = "text";
    } else {
        y.type = "password";
    }
    if (z.type === "password") {
        z.type = "text";
    } else {
        z.type = "password";
    }
}

// function hidePass(){
//   var x = document.getElementById("Pass");
//   if (x.type === "text") {
//     x.type = "password";
//   }
// }

// var myInput = document.getElementById("Pass").value;
// var myInput2 = document.getElementById("pass2").value;
// var y = document.getElementById("pass2");

function checkUp(input) {
    if (input.value != document.getElementById('pass2').value) {
        document.getElementById("invalid").innerHTML = "Password does not match";
    } else {
        document.getElementById("invalid").innerHTML = "";
    }
}

function checkDown(input) {
    if (input.value != document.getElementById('Pass').value) {
        document.getElementById("invalid").innerHTML = "Password does not match";
    } else {
        document.getElementById("invalid").innerHTML = "";
    }
}

// When the user starts to type something inside the password field
// y.onkeyup = function() {
//   alert(myInput2);
//   if (myInput2 === myInput){
//     document.getElementById("invalid").innerHTML = "";
//   }else{
//     document.getElementById("invalid").innerHTML = "Password does not match";
//   }

//// Validate lowercase letters
//   var lowerCaseLetters = /[a-z]/g;
//   if(myInput.value.match(lowerCaseLetters)) {
//     letter.classList.remove("invalid");
//     letter.classList.add("valid");
//   } else {
//     letter.classList.remove("valid");
//     letter.classList.add("invalid");
// }

//   // Validate capital letters
//   var upperCaseLetters = /[A-Z]/g;
//   if(myInput.value.match(upperCaseLetters)) {
//     capital.classList.remove("invalid");
//     capital.classList.add("valid");
//   } else {
//     capital.classList.remove("valid");
//     capital.classList.add("invalid");
//   }

//   // Validate numbers
//   var numbers = /[0-9]/g;
//   if(myInput.value.match(numbers)) {
//     number.classList.remove("invalid");
//     number.classList.add("valid");
//   } else {
//     number.classList.remove("valid");
//     number.classList.add("invalid");
//   }

//   // Validate length
//   if(myInput.value.length >= 8) {
//     length.classList.remove("invalid");
//     length.classList.add("valid");
//   } else {
//     length.classList.remove("valid");
//     length.classList.add("invalid");
//   }
// }

window.onscroll = function() {posFix()};

var header = document.getElementById("main-header");
var sticky = header.offsetTop;

function posFix() {
    if (window.pageYOffset > sticky) {
        header.classList.add("sticky");
        header.style.boxShadow = "0 2px 10px rgba(0,0,0,.5)";
    } else {
        header.classList.remove("sticky");
        if(header.classList.contains("alt") == true || header.classList.contains("log") == true){
            header.style.boxShadow = "none";
        }else{
            header.style.boxShadow = "0 0 0.25em 0 rgba(0, 0, 0, 0.15)";
        }
    }
}