<%@ page import="java.util.List" %>
<%@ page import="com.example.websocketdemo.entity.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CloudBond - Server Interface</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="/css/generic2.css" />
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600" rel="stylesheet">
</head>
<body>


<section id="logGrid">
    <div class="logLeft">
        <div class="logBlur"></div>

        <div class="logWrap2">
            <form class="animate" method="post" action="/admin/add" id="RegisterServlet">

                <div class="logPop in">
                    <h1>Add User</h1>
                    <label><b>Username</b></label>

                    <input type="text" placeholder="Enter Username" name="userName" required>
                    <br>
                    <label><b>Password</b></label>
                    <button type="button" onclick = "showPass()" class="see">
                        <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" data-prefix="fas" data-icon="eye" class="svg-eye" role="img" viewBox="0 0 576 512"><path fill="currentColor" d="M569.354 231.631C512.969 135.949 407.81 72 288 72 168.14 72 63.004 135.994 6.646 231.631a47.999 47.999 0 0 0 0 48.739C63.031 376.051 168.19 440 288 440c119.86 0 224.996-63.994 281.354-159.631a47.997 47.997 0 0 0 0-48.738zM288 392c-75.162 0-136-60.827-136-136 0-75.162 60.826-136 136-136 75.162 0 136 60.826 136 136 0 75.162-60.826 136-136 136zm104-136c0 57.438-46.562 104-104 104s-104-46.562-104-104c0-17.708 4.431-34.379 12.236-48.973l-.001.032c0 23.651 19.173 42.823 42.824 42.823s42.824-19.173 42.824-42.823c0-23.651-19.173-42.824-42.824-42.824l-.032.001C253.621 156.431 270.292 152 288 152c57.438 0 104 46.562 104 104z"/></svg>
                    </button>

                    <input id="Pass" type="password" placeholder="Enter Password" name="password" required oninput="checkUp(this)">
                    <br>
                    <input id="pass2" type="password" placeholder="Confirm Password" name="password2" required oninput="checkDown(this)">
                    <span class ="red" id="invalid"></span>
                    <br><br>
                    <button class="white" type="submit">Add user</button>
                    <br><br>
                </div>
            </form>
        </div>

        <div id="signIn" class="logWrap">
            <!--
                        <form class="animate" action="LoginServlet" method="post" id="LoginServlet">

                          <div class="logPop in">
                            <h1>Time to start bonding!</h1>
                            <h2> </h2>
                            <br>
                            <label for="uname"><b>Username</b></label>
                            <input type="text" placeholder="Enter Username" name="username" required>
                            <br>
                            <label for="psw"><b>Password</b></label>
                            <button type="button" onclick = "showPass()" onmouseout="hidePass()" class="see">
                                <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" data-prefix="fas" data-icon="eye" class="svg-eye" role="img" viewBox="0 0 576 512"><path fill="currentColor" d="M569.354 231.631C512.969 135.949 407.81 72 288 72 168.14 72 63.004 135.994 6.646 231.631a47.999 47.999 0 0 0 0 48.739C63.031 376.051 168.19 440 288 440c119.86 0 224.996-63.994 281.354-159.631a47.997 47.997 0 0 0 0-48.738zM288 392c-75.162 0-136-60.827-136-136 0-75.162 60.826-136 136-136 75.162 0 136 60.826 136 136 0 75.162-60.826 136-136 136zm104-136c0 57.438-46.562 104-104 104s-104-46.562-104-104c0-17.708 4.431-34.379 12.236-48.973l-.001.032c0 23.651 19.173 42.823 42.824 42.823s42.824-19.173 42.824-42.823c0-23.651-19.173-42.824-42.824-42.824l-.032.001C253.621 156.431 270.292 152 288 152c57.438 0 104 46.562 104 104z"/></svg>
                            </button>
                            <input id="pass3" type="password" placeholder="Enter Password" name="password" required>
                            <br><br>
                            <button class="white" type="submit">Login</button>
                            <label>
                            <input type="checkbox" name="remember"> Remember me
                            </label> -->
        </div>
        </form>
    </div>
    </div>

    <div class="logRight2">
        <h1>User List</h1>

        <table id="uList">
            <%
        List<User> userList = (List<User>)request.getAttribute("userList");
                System.out.println("UserList: " +userList.toString());
        for(User currentUser : userList){
            String username = currentUser.getUserName();
            %>
            <form method="post" action="/admin/deleteUser" >
                <tr style="height:10vh">
                    <td>
                        <div style="width: 22vw; font-weight: bold; font-size: 1.5em; padding-left: 1em;" >
                            <%=username%><input name="userName" value="<%=username%>" style="display:none">
                        </div>
                    </td>
                    <td><button type="submit">Delete</button></td>
                </tr>
            </form>
            <%
        }
            %>
        </table>
    </div>
</section>

<header id="main-header" class="log">
    <!-- <div class="logHeader">
     <a href="index.html" class="logo"><strong>DI<span>I</span></strong><span>nteractive</span></a>

       <form action="LoginServlet" method="post" id="LoginServlet" class="logSide">
       <div class="a"><input type="text" class="logInput" name="session[username_or_email]" autocomplete="username" placeholder="Username"></div>
       <div class="b">
         <input type="password" class="logInput" name="session[password]" placeholder="Password" autocomplete="current-password"> -->
    <!-- <a href="#forget">Forgot Password?</a>
  </div> -->
    <div class="logHeader2">
        <img src="/DSLOGO.png" alt="" class="CBlogo">
    </div>
    <!-- <div class="c"><button class="see">
        <svg aria-hidden="true" data-prefix="far" data-icon="sign-in-alt" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="svg-login"><path fill="currentColor" d="M144 112v51.6H48c-26.5 0-48 21.5-48 48v88.6c0 26.5 21.5 48 48 48h96v51.6c0 42.6 51.7 64.2 81.9 33.9l144-143.9c18.7-18.7 18.7-49.1 0-67.9l-144-144C195.8 48 144 69.3 144 112zm192 144L192 400v-99.7H48v-88.6h144V112l144 144zm80 192h-84c-6.6 0-12-5.4-12-12v-24c0-6.6 5.4-12 12-12h84c26.5 0 48-21.5 48-48V160c0-26.5-21.5-48-48-48h-84c-6.6 0-12-5.4-12-12V76c0-6.6 5.4-12 12-12h84c53 0 96 43 96 96v192c0 53-43 96-96 96z" class=""></path></svg>
        </a>
       </button> -->
    </form>

    </div>
</header>

<footer id="logFooter">
    <div class="footerWrapper">
        <div class="footer-social-list">
            <!-- <a href="#facebook">
              <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" data-prefix="fab" data-icon="facebook-square" class="svg-fb" role="img" viewBox="0 0 448 512"><path fill="currentColor" d="M448 80v352c0 26.5-21.5 48-48 48h-85.3V302.8h60.6l8.7-67.6h-69.3V192c0-19.6 5.4-32.9 33.5-32.9H384V98.7c-6.2-.8-27.4-2.7-52.2-2.7-51.6 0-87 31.5-87 89.4v49.9H184v67.6h60.9V480H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48z"/></svg>
            </a>
            <a href="#twitter">
                <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" data-prefix="fab" data-icon="twitter-square" class="svg-tw" role="img" viewBox="0 0 448 512"><path fill="currentColor" d="M400 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm-48.9 158.8c.2 2.8.2 5.7.2 8.5 0 86.7-66 186.6-186.6 186.6-37.2 0-71.7-10.8-100.7-29.4 5.3.6 10.4.8 15.8.8 30.7 0 58.9-10.4 81.4-28-28.8-.6-53-19.5-61.3-45.5 10.1 1.5 19.2 1.5 29.6-1.2-30-6.1-52.5-32.5-52.5-64.4v-.8c8.7 4.9 18.9 7.9 29.6 8.3a65.447 65.447 0 0 1-29.2-54.6c0-12.2 3.2-23.4 8.9-33.1 32.3 39.8 80.8 65.8 135.2 68.6-9.3-44.5 24-80.6 64-80.6 18.9 0 35.9 7.9 47.9 20.7 14.8-2.8 29-8.3 41.6-15.8-4.9 15.2-15.2 28-28.8 36.1 13.2-1.4 26-5.1 37.8-10.2-8.9 13.1-20.1 24.7-32.9 34z"/></svg>
            </a>
            <a href="#insta">
              <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" data-prefix="fab" data-icon="instagram" class="svg-insta" role="img" viewBox="0 0 448 512"><path fill="currentColor" d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"/></svg>
            </a>
            <a href="#linked">
                <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" data-prefix="fab" data-icon="linkedin" class="svg-li" role="img" viewBox="0 0 448 512"><path fill="currentColor" d="M416 32H31.9C14.3 32 0 46.5 0 64.3v383.4C0 465.5 14.3 480 31.9 480H416c17.6 0 32-14.5 32-32.3V64.3c0-17.8-14.4-32.3-32-32.3zM135.4 416H69V202.2h66.5V416zm-33.2-243c-21.3 0-38.5-17.3-38.5-38.5S80.9 96 102.2 96c21.2 0 38.5 17.3 38.5 38.5 0 21.3-17.2 38.5-38.5 38.5zm282.1 243h-66.4V312c0-24.8-.5-56.7-34.5-56.7-34.6 0-39.9 27-39.9 54.9V416h-66.4V202.2h63.7v29.2h.9c8.9-16.8 30.6-34.5 62.9-34.5 67.2 0 79.7 44.3 79.7 101.9V416z"/></svg>
            </a>
            <a href="#yt">
                <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" data-prefix="fab" data-icon="youtube-square" class="svg-yt" role="img" viewBox="0 0 448 512"><path fill="currentColor" d="M186.8 202.1l95.2 54.1-95.2 54.1V202.1zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48zm-42 176.3s0-59.6-7.6-88.2c-4.2-15.8-16.5-28.2-32.2-32.4C337.9 128 224 128 224 128s-113.9 0-142.2 7.7c-15.7 4.2-28 16.6-32.2 32.4-7.6 28.5-7.6 88.2-7.6 88.2s0 59.6 7.6 88.2c4.2 15.8 16.5 27.7 32.2 31.9C110.1 384 224 384 224 384s113.9 0 142.2-7.7c15.7-4.2 28-16.1 32.2-31.9 7.6-28.5 7.6-88.1 7.6-88.1z"/></svg>
            </a> -->
            <p>Copyright &copy; 2018-2019 CloudBond. All Rights Reserved.</p>
        </div>
    </div>
</footer>
<script src="/js/main.js"></script>
</body>
</html>