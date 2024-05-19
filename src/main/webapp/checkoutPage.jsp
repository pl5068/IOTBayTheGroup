<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.iotbay.iotbaydemo.Product" %>
<%@ page import="java.util.List" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IOTBay | Checkout</title>
        <link href='styles/common.css' rel="stylesheet" type="text/css">
        <link rel="icon" type="image/x-icon" href="iotbay.ico">
    </head>
    <body>
        <div class="checkout-container">
            <div class="delivery-info">
                <div class="delivery-content">
                    <h1>Delivery Information</h1>
                    <form action="add_delivery_info" method="post" class="delivery-box">
                        <label class="delivery-input">
                            <div class="text-field-label">First Name</div>
                            <input name="first" type="text" class="text-field large" maxlength="24" placeholder="First Name" required />
                        </label>
                        <label class="delivery-input">
                            <div class="text-field-label">Last Name</div>
                            <input name="surname" type="text" class="text-field large" maxlength="24" placeholder="Last Name" required />
                        </label>
                        <label class="delivery-input">
                            <div class="text-field-label">Street</div>
                            <input name="street" type="text" class="text-field large" maxlength="60" placeholder="Street" required />
                        </label>
                        <label class="delivery-input">
                            <div class="text-field-label">City</div>
                            <input name="city" type="text" class="text-field large" maxlength="24" placeholder="City" required />
                        </label>
                        <label class="delivery-input">
                            <div class="text-field-label">State</div>
                            <input name="state" type="text" class="text-field large" maxlength="24" placeholder="State" required />
                        </label>
                        <label class="delivery-input">
                            <div class="text-field-label">Postcode</div>
                            <input name="postcode" type="text" class="text-field postcode" maxlength="4" placeholder="Postcode" required />
                        </label>
                        <button type="submit" style="width: 100%" class="button primary payment">Continue to Payment</button>
                        <input type="hidden" value="yes" name="submitted">       
                    </form>
                </div>
            </div>
            <div class="order-info">
                <h1 class="order-header">Cart</h1>
                <div class="order-box">
                    <table class="order-table" id="order_table">
                        <tbody>
                            <c:forEach var="item" items="${cartItems}" >
                                <tr>
                                    <td> <c:out value="${item.name}"/></td>
                                    <td> <c:out value="${item.unitPrice}"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <p class="shipping_cost"><strong>Shipping</strong> - $12</p>
                    <p id="total_price" class="order_total"><strong>Total</strong> - $0.00</p>
                </div>
                <script>
                    function calcTotal() {
                        var total = 0;
                        var table = document.getElementById("order_table");
                        var rows = table.getElementsByTagName("tr");

                        for (var i = 0; i < rows.length; i++) {
                            var cells = rows[i].getElementsByTagName("td");
                            if (cells.length > 1) {
                                var price = parseFloat(cells[1].innerText.replace('$', ''));
                                total += price;
                            }
                        }

                        total += parseFloat(document.querySelector(".shipping_cost").innerText.replace('Shipping - $', ''));
                        document.getElementById("total_price").innerText = "Total - $" + total.toFixed(2);
                    }

                    calcTotal();
                </script>
            </div>
        </div>
    </body>
</html>
