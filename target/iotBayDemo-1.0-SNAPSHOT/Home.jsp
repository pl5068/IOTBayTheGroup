<%-- 
    Document   : Home
    Created on : 7 Apr. 2024, 11:37:09 pm
    Author     : kian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href='styles/index.css' rel="stylesheet" type="text/css">
        <link href='styles/common.css' rel="stylesheet" type="text/css">
    </head>
    <body style="background: var(--accent-2)">
        <div style="min-height: 100vh; display: flex; flex-direction: column; justify-content: center; align-items: center">
            <div class="auth-box">
                <h3 style="text-align: start; margin-top: 24px;">Welcome, user!</h3>
                <p>Your email is: <b>user@example.com</b></p>
                <p>Thanks for being a customer of IoTBay!</p>
            </div>
            <a href="#">Sign out</a>
        </div>
    </body>
</html>
