<%@ page import="java.util.List" %>
<%@ page import="com.example.websocketdemo.entity.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CloudBond - Server Interface</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="/css/main.css">
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
        </div>
    </div>
    </div>

    <div class="logRight2">
        <h1>User List</h1>

        <table id="uList" class="style-2">
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
    <div class="logHeader2">
        <img src="/DSLOGO.png" alt="" class="CBlogo">
    </div>
</header>

<footer id="logFooter">
    <div class="footerWrapper">
        <div class="footer-social-list">
            <p>Copyright &copy; 2018-2019 CloudBond. All Rights Reserved.</p>
        </div>
    </div>
</footer>
<script src="/js/main.js"></script>
</body>
</html>