<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.iotbay.iotbaydemo.Product" %>
<%@ page import="java.util.List" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>IOTBay - Cart</title>
    <link href="styles/common.css" rel="stylesheet" type="text/css">
</head>
<body style="background: var(--accent-2);">
    <h1>Your Cart</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${cartItems}" >
                <tr>
                    <td> <c:out value="${item.id}"/></td>
                    <td> <c:out value="${item.name}"/></td>
                    <td> <c:out value="${item.unitPrice}"/></td>
                    <td> <c:out value="${item.unitPrice}"/></td>
                    
                      
                 
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
     <a href="checkoutPage.jsp" class="button primary payment">Proceed to Checkout</a>
</body>
</html>