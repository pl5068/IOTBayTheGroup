<%@page import="com.iotbay.iotbaydemo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IOTBay | User</title>
        <link href='styles/index.css' rel="stylesheet" type="text/css">
        <link href='styles/common.css' rel="stylesheet" type="text/css">
        <script language="JavaScript" type="text/javascript" src="<?php echo get_option('siteurl') ?>/js/jquery-1.2.6.min.js"></script>
        <script language="JavaScript" type="text/javascript" src="<?php echo get_option('siteurl') ?>/js/jquery-ui-personalized-1.5.2.packed.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    </head>
    <body style="background: var(--accent-2)">
        <c:set var = "edit" scope = "page" value = "${requestScope.edit}"/>
        <div style="min-height: 100vh; display: flex; flex-direction: column; justify-content: center; align-items: center">
            <div class="auth-box" style="position: relative;">
                <a href="<c:url value = "profilePage.jsp">
                       <c:param name="edit" value="${param.edit == 'yes' ? 'no' : 'yes'}"/>
                   </c:url>">
                    <div style="position: absolute; right:1rem; top: 1rem;">
                        <i class="material-icons" >edit</i>
                    </div>
                </a>
                <h3 style="text-align: start; margin-top: 24px;">Welcome, <jsp:getProperty name = "user" property = "firstName"/>!</h3>
                <c:choose>
                    <c:when test = "${param.edit == 'yes'}">
                        <form action="user_edit" method="post">
                            <input type="hidden" value="<%= ((User) request.getSession().getAttribute("user")).getId()%>" name="id">       
                            <p>Email: <input name="email" value="<jsp:getProperty name = "user" property = "email"/>" type="email" class="text-field large" placeholder="Enter your email address" required /></p>
                            <p>Phone: <input name="phoneNumber" value="<jsp:getProperty name = "user" property = "phoneNumber"/>" pattern="[0-9]+" class="text-field large" placeholder="Enter your phone number" required /></p>
                            <p>DOB: <b><jsp:getProperty name = "user" property = "dob"/></b></p>
                            <div style=" display: flex; flex-direction: row; justify-content: space-between; width: 100%; align-items: center; margin-top:1.5rem;">
                                <a href="profilePage.jsp" style="width: 47.5%; text-decoration: none">
                                    <button type="button" class="button" style="width: 100%; text-decoration: none">Cancel</button>
                                </a>
                                <button type="submit" value="cancel" name="delete" class="button" style="width: 47.5%">Save</button>
                            </div>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <p>Email: <b><jsp:getProperty name = "user" property = "email"/></b></p>
                        <p>Phone: <b><jsp:getProperty name = "user" property = "phoneNumber"/></b></p>
                        <p>DOB: <b><jsp:getProperty name = "user" property = "dob"/></b></p>
                        <p>Thanks for being a customer of IOTBay!</p>
                        <a href="user_logs_view" >My Access Logs</a>
                    </c:otherwise>
                </c:choose>
            </div>
            <a href="user_logout">Sign out</a>
            <form action="user_delete" method="post" class="auth-box" style=" padding: 0; position: absolute; bottom: 0px;">
                <button type="submit" value="<c:out value="${param.delete == 'showconf' ? 'no' : 'showconf'}"/>" name="delete" style="width: 100%" class="button primary large">Delete account</button>
                <input type="hidden" value="<%= ((User) request.getSession().getAttribute("user")).getId()%>" name="id">       
                <%
                    String delete = request.getParameter("delete");
                    if (delete != null && delete.equals("showconf")) {
                %>
                <div style=" display: flex; flex-direction: column; justify-content: center; align-items: center; margin: 1rem;">
                    <p id="error" style="margin:1rem; margin-top: 0">Are you sure? This cannot be reversed.</p>
                    <div style=" display: flex; flex-direction: row; justify-content: space-between; width: 100%; align-items: center">
                        <button type="submit"  value="confirm" name="delete" class="button" style="width: 45%">Yes</button>
                        <button type="submit" value="cancel" name="delete" class="button" style="width: 45%">No</button>
                    </div>
                </div>
                <% }%>
            </form>
        </div>
    </body>
</html>
