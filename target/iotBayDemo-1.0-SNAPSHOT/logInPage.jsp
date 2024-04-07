<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in — IoTBay</title>
        <link href='styles/common.css' rel="stylesheet" type="text/css">
    </head>
    <body style="background: var(--accent-2);">
        <div class="auth-page">
            <div class="auth-content">
                <h2>Log in to IotBay</h2>
                <form action="" method="post" class="auth-box">
                    <label class="auth-input">
                        <div class="text-field-label">Email</div>
                        <input name="email" type="email" class="text-field large" placeholder="Enter your email address" required />
                    </label>
                    <label class="auth-input">
                        <div class="text-field-label">Password</div>
                        <input name="password" type="password" class="text-field large" placeholder="Enter your password" required />
                    </label>
                    <button type="submit" style="width: 100%" class="button primary large">Log in</button>
                </form>
                <a href="registerPage.jsp">Don't have an account? Register</a>
                <form method='POST' action="user_login">
                    <table>
                        <tr>
                            <td>
                                <label>Email </label>
                            </td>
                            <td>
                                <input name="email" type="text" id="email">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Password </label>
                            </td>
                            <td>
                                <input name="password" type="password" id="password">
                            </td>
                        </tr>
                    </table>
                    <button type="submit">
                        Submit
                    </button>
                </form>
            </div>
        </div>
    </body>
</html>
