<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IOTBay | Register</title>
        <link href='styles/common.css' rel="stylesheet" type="text/css">
    </head>
    <body style="background: var(--accent-2);">
        <div class="auth-page">
            <div class="auth-content">
                <h2>Register for IOTBay</h2>
                <form action="user_register" method="POST" class="auth-box">
                    <label class="auth-input">
                        <div class="text-field-label">Email</div>
                        <input name="email" type="email" class="text-field large" placeholder="Enter your email address" required />
                    </label>
                    <label class="auth-input">
                        <div class="text-field-label">Password</div>
                        <input name="password" type="password" class="text-field large" placeholder="Enter your password" required />
                    </label>
                    <label class="auth-input">
                        <div class="text-field-label">First Name</div>
                        <input name="firstName" type="text" class="text-field large" placeholder="Enter your first name" required />
                    </label>
                    <label class="auth-input">
                        <div class="text-field-label">Date of Birth</div>
                        <input name="dob" type="date" class="text-field large" placeholder="Enter DOB" required />
                    </label>
                    <button type="submit" style="width: 100%" class="button primary large">Register</button>
                    <input type="hidden" value="yes" name="submitted">       
                    <%
                        String regFailed = request.getParameter("submitted");
                        if (regFailed != null && regFailed.equals("yes")) {
                    %>
                    <p id="error">Please fill all fields before submitting</p>
                    <% }%>
                </form>
                <a href="logInPage.jsp">Already have an account? Log in</a>
            </div>
        </div>
    </body>
</html>
