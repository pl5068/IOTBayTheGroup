<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IOTBay | Home</title>
        <link href='styles/index.css' rel="stylesheet" type="text/css">
        <link href='styles/common.css' rel="stylesheet" type="text/css">
    </head>
    <body style="background: var(--accent-2)">
        <div style="min-height: 100vh; display: flex; flex-direction: column; justify-content: center; align-items: center">
            <div class="auth-box">
                <h3 style="text-align: start; margin-top: 24px;">Welcome, <jsp:getProperty name = "user" property = "firstName"/>!</h3>
                <p>Email: <b><jsp:getProperty name = "user" property = "email"/></b></p>
                <p>DOB: <b><jsp:getProperty name = "user" property = "dob"/></b></p>
                <p>Thanks for being a customer of IOTBay!</p>
            </div>
            <a href="user_logout">Sign out</a>
        </div>
    </body>
</html>
