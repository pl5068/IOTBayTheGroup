<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IOTBay - Welcome</title>
        <link href='styles/common.css' rel="stylesheet" type="text/css">
    </head>
     <body style="background: var(--accent-2);">
        <div class="auth-page">
            <div class="auth-content">
                <h1>Welcome, <jsp:getProperty name = "user" property = "firstName"/>!</h1>
                <a href="profilePage.jsp">Continue to main page</a>
                <a href="user_list_admin">Continue to admin page</a>
                <a href="catalogue_view">Continue to Catalogue page</a>
            </div>
        </div>
    </body>
</html>

