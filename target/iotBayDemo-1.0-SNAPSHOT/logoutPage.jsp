<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/templates/common.jsp" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged Out | IOTBay</title>
        <link href='styles/common.css' rel="stylesheet" type="text/css">
    </head>
    <body style="background: var(--accent-2)">
        <jsp:include page="/templates/navbar.jsp" />
        <div style="min-height: 100vh; display: flex; flex-direction: column; justify-content: center; align-items: center">
            <h2>You are now logged out. Please close the window.</h2>
            <a href="logInPage.jsp" class="hyperlink" >Log in</a>
        </div>
    </body>
</html>
