<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IOTBay - Checkout</title>
        <link href='styles/common.css' rel="stylesheet" type="text/css">
    </head>
    <body style="background: var(--accent-2);">
        <div class="delivery-info">
            <div class="delivery-content">
                <h1>Delivery Information</h1>
                <form action="Cart" method="post" class="delivery-box">
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
                    <% } %>
                </form>
                <div class="order-info">
                    <h1>Cart</h1>
                    <div class="order-box">
                        <table class="order-table" id="order_table">
                            <thead>
                                <tr>
                                    <th>Product ID</th>
                                    <th>Date of Birth</th>
                                    <th>Gender</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                </tr>
                            </thead>
                            <tbody>

                               


                            </tbody>
                        </table>

                        <p class="shipping_cost">Shipping: $15</p>
                        <p class="order_total" id="total_price">Total: $0.00</p>
                    </div>
                </div>
                <script>
                    function calcTotal() {
                        var total = 0;
                        var table = document.getElementById("order_table");
                        var rows = table.getElementsByTagName("tr");

                        for (var i = 1; i < rows.length; i++) { // Skip the header row
                            var cells = rows[i].getElementsByTagName("td");
                            if (cells.length === 5) {
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