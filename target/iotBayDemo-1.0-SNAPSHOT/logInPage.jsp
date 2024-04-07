<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href='styles/common.css' rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id='page'>
            <div id='body'>
                <h1>Login</h1>
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
