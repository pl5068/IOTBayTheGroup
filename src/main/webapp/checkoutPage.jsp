<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IOTBay - Checkout</title>
        <link href='styles/common.css' rel="stylesheet" type="text/css">
        <link rel="icon" type="image/x-icon" href="iotbay.ico">
    </head>
    <body style="background: var(--accent-2);">
        <div class="checkout-container">
            <div class="delivery-info">
                <div class="delivery-content">
                    <h1>Delivery Information</h1>
                    <form action="user_delivery_details" method="post" class="delivery-box">
                        <label class="delivery-input">
                            <div class="text-field-label">First Name</div>
                            <input name="first" type="text" class="text-field large" placeholder="First Name" required />
                        </label>
                        <label class="delivery-input">
                            <div class="text-field-label">Last Name</div>
                            <input name="surname" type="text" class="text-field large" placeholder="Last Name" required />
                        </label>
                        <label class="delivery-input">
                            <div class="text-field-label">Street</div>
                            <input name="street" type="text" class="text-field large" placeholder="Street" required />
                        </label>
                        <label class="delivery-input">
                            <div class="text-field-label">City</div>
                            <input name="city" type="text" class="text-field large" placeholder="City" required />
                        </label>
                        <label class="delivery-input">
                            <div class="text-field-label">State</div>
                            <input name="state" type="text" class="text-field large" placeholder="State" required />
                        </label>
                        <label class="delivery-input">
                            <div class="text-field-label">Postcode</div>
                            <input name="postcode" type="text" class="text-field postcode" placeholder="Postcode" required />
                        </label>
                        <button type="submit" style="width: 100%" class="button primary payment">Continue to Payment</button>
                        <input type="hidden" value="yes" name="submitted">       
                        <%
                            String regFailed = request.getParameter("submitted");
                            if (regFailed != null && regFailed.equals("yes")) {
                        %>
                        <p id="error">Please fill out all fields before continuing to payment!</p>
                        <% }%>
                    </form>
                </div>
            </div>
            <div class="order-info">
                <h1 class="order-header">Cart</h1>
                <div class="order-box">
                    <table class="order-table" id="order_table">
                        <tr>
                            <td>Minion Router (Large)</td>
                            <td>$100</td>
                        </tr>
                        <tr>
                            <td>100m Ethernet Wire</td>
                            <td>$5</td>
                        </tr>
                    </table>
                    <p class="shipping_cost">Shipping: $15</p>
                    <p id="total_price" class="order_total">Total: $0.00</p>
                </div>
                <script>
                    function calcTotal() {
                        var total = 0;
                        var table = document.getElementById("order_table");
                        var rows = table.getElementsByTagName("tr");

                        for (var i = 0; i < rows.length; i++) {
                            var cells = rows[i].getElementsByTagName("td");
                            if (cells.length === 2) {
                                var price = parseFloat(cells[1].innerText.replace('$', ''));
                                total += price;
                            }
                        }

                        total += parseFloat(document.querySelector(".shipping_cost").innerText.replace('Shipping: $', ''));
                        document.getElementById("total_price").innerText = "Total: $" + total.toFixed(2);
                    }

                    calcTotal();
                </script>
            </div>
        </div>
    </body>
</html>