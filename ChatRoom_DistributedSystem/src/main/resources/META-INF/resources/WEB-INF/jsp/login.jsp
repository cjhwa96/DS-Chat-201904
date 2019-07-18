<!DOCTYPE html>
<html>

  <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
      <title>Spring Boot WebSocket Chat Application</title>
      <link rel="stylesheet" href="/css/main.css" />
  </head>
  <body>
    <noscript>
      <h2>Sorry! Your browser doesn't support Javascript</h2>
    </noscript>


    <div id="username-page">
        <div class="username-page-container">
            <h1 class="title">Type your username</h1>
            <div> ${message}</div>
            <form id="usernameForm" name="usernameForm" action="/login/a">
                <div class="form-group">
                    <input type="text" name="userName" id="name" placeholder="Username" autocomplete="off" class="form-control" />
                    <input type="text" name="password" id="password" placeholder="Password" autocomplete="off" class="form-control" />
                </div>
                <div class="form-group">
                    <button type="submit" class="accent username-submit">Start Chatting</button>
                </div>
            </form>
        </div>
    </div>

  </body>
</html>
