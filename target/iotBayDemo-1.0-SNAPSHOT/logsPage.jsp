
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
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
    </body>
</html>
