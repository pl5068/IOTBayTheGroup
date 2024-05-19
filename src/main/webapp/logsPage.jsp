
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IOTBay | User Logs</title>
        <link href='styles/index.css' rel="stylesheet" type="text/css">
        <link href='styles/common.css' rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="tablecontainer">
            <a href="profilePage.jsp">Go back</a>
            <table class="fancy-table">
                <tr>
                    <th>Action</th>
                    <th>Time</th>
                </tr>
                <c:forEach var="entry" items="${logEntries}">
                    <tr>
                        <td><c:out value="${entry.logAction}"/></td>
                        <td><c:out value="${entry.timeOperation}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
