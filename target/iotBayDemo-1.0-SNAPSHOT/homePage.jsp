<%@page import="com.iotbay.iotbaydemo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IOTBay | Home</title>
        <link href='styles/index.css' rel="stylesheet" type="text/css">
        <link href='styles/common.css' rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/javascript" src="<?php echo get_option('siteurl') ?>/js/jquery-1.2.6.min.js"></script>
        <script language="JavaScript" type="text/javascript" src="<?php echo get_option('siteurl') ?>/js/jquery-ui-personalized-1.5.2.packed.js"></script>
    </head>
    <script>
        function confirmation(button) {
            var href = button.getAttribute("href");
            var result = confirm("Are you sure you want to delete?");

            if (result) {
                fetch('href', {
                    method: 'DELETE'
                });
            } else {
                return false;
            }
        }
    </script>
    <body style="background: var(--accent-2)">
        <div style="min-height: 100vh; display: flex; flex-direction: column; justify-content: center; align-items: center">
            <div class="auth-box">
                <h3 style="text-align: start; margin-top: 24px;">Welcome, <jsp:getProperty name = "user" property = "firstName"/>!</h3>
                <p>Email: <b><jsp:getProperty name = "user" property = "email"/></b></p>
                <p>DOB: <b><jsp:getProperty name = "user" property = "dob"/></b></p>
                <p>Thanks for being a customer of IOTBay!</p>
            </div>
            <a href="user_logout">Sign out</a>
            <form action="user_delete" method="post" class="auth-box">
                    <button type="submit" style="width: 100%" class="button primary large">Delete account</button>
                    <input type="hidden" value="no" name="confirmed">
                    <input type="hidden" value="<%= ((User) request.getSession().getAttribute("user")).getId() %>" name="id">       
                    <%
                        String confirmed = request.getParameter("confirmed");
                        if (confirmed != null && confirmed.equals("no")) {
                    %>
                    <p id="error">Are you sure?</p>
                    <% }%>

                </form>
            <button href="user_delete" onclick="confirmation(this)">Delete account</button>
        </div>
    </body>
</html>
