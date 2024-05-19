<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page | IOTBay</title>
        <link href="styles/ben.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <h1>Welcome to User Management, <jsp:getProperty name="user" property="firstName"/>!</h1>

        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Search by First Name, Last Name, or Phone Number">
        </div>

        <div id="addUserPopup" class="popup">
            <div class="popup-content">
                <button class="close-button" onclick="closeAddUserPopup()">&#x2716;</button>
                <h2>Register a New User</h2>
                <form action="user_register_admin" method="POST" class="auth-box">
                    <label class="auth-input">
                        <div class="text-field-label">Email:</div>
                        <input name="email" type="email" class="text-field large" placeholder="Enter your email address" required />
                    </label>
                    <label class="auth-input">
                        <div class="text-field-label">Password:</div>
                        <input name="password" type="password" class="text-field large" placeholder="Enter your password" required />
                    </label>
                    <label class="auth-input">
                        <div class="text-field-label">First Name:</div>
                        <input name="firstName" type="text" class="text-field large" placeholder="Enter your first name" required />
                    </label>
                    <label class="auth-input">
                        <div class="text-field-label">Last Name:</div>
                        <input name="lastName" type="text" class="text-field large" placeholder="Enter your surname" required />
                    </label>
                    <label class="auth-input">
                        <div class="text-field-label">Date of Birth:</div>
                        <input name="dob" type="date" class="text-field large" placeholder="Enter DOB" required />
                    </label>
                    <label class="auth-input">
                        <div class="text-field-label">Phone Number:</div>
                        <input name="phoneNumber" pattern="[0-9]+" class="text-field large" placeholder="Enter your phone number" required />
                    </label>
                    <div class="auth-input">
                        <div class="text-field-label">User Type:</div>
                        <div class="user-type">
                            <input type="radio" id="staffRadio" name="userType" value="staff">
                            <label for="staffRadio">Staff Member</label>
                            <input type="radio" id="userRadio" name="userType" value="user" checked>
                            <label for="userRadio">User</label>
                        </div>
                    </div>
                    <button type="submit" style="width: 100%" class="button">Register</button>
                    <input type="hidden" value="yes" name="submitted">
                </form>
            </div>
        </div>

        <div id="editUserPopup" class="popup">
            <div class="popup-content">
                <button class="close-button" onclick="closeEditUserPopup()">&#x2716;</button>
                <h2>Edit User</h2>
                <form id="editUserForm" action="user_edit_admin" method="POST" class="auth-box">
                    <label class="auth-input">
                        <div class="text-field-label">Email:</div>
                        <input name="email" type="email" class="text-field large" placeholder="Enter your email address" required />
                    </label>
                    <label class="auth-input">
                        <div class="text-field-label">Phone Number:</div>
                        <input name="phoneNumber" pattern="[0-9]+" class="text-field large" placeholder="Enter your phone number" required />
                    </label>
                    <input type="hidden" name="id" id="editUserId" />
                    <button type="submit" style="width: 100%" class="button">Save Changes</button>
                </form>
            </div>
        </div>

        <%@ page import="java.util.List, com.iotbay.iotbaydemo.User" %>
        <%
          List<User> users = (List<User>) request.getAttribute("users");
        %>

        <table id="userTable" class="table">
          <thead>
            <tr>
              <th>ID</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Phone Number</th>
              <th>Email</th>
              <th>Date of Birth</th>
              <th>Password</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:if test="${not empty users}">
              <c:forEach var="user" items="${users}">
                <tr>
                  <td>${user.id}</td>
                  <td>${user.firstName}</td>
                  <td>${user.lastName}</td>
                  <td>${user.phoneNumber}</td>
                  <td>${user.email}</td>
                  <td>${user.dob}</td>
                  <td>${user.password}</td>
                  <td>
                    <button onclick="editUser(${user.id}, '${user.email}', '${user.phoneNumber}')" class="btn btn-edit">Edit</button>
                    <button onclick="confirmDelete(${user.id})" class="btn btn-minus">Delete</button>
                  </td>
                </tr>
              </c:forEach>
            </c:if>
          </tbody>
        </table>

        <a class="fixedButton" href="#" onclick="showAddUserPopup()">
            <div class="roundedFixedBtn">+</div>
        </a>

        <form id="deleteForm" action="user_delete_admin" method="POST" style="display:none;">
            <input type="hidden" name="id" id="deleteUserId">
        </form>

        <script>
            function showAddUserPopup() {
                const addUserPopup = document.getElementById("addUserPopup");
                addUserPopup.style.display = "block";
            }
            
            function closeAddUserPopup() {
                const addUserPopup = document.getElementById("addUserPopup");
                addUserPopup.style.display = "none";
            }

            function showEditUserPopup() {
                const editUserPopup = document.getElementById("editUserPopup");
                editUserPopup.style.display = "block";
            }

            function closeEditUserPopup() {
                const editUserPopup = document.getElementById("editUserPopup");
                editUserPopup.style.display = "none";
            }

            function editUser(id, email, phoneNumber) {
                document.getElementById("editUserId").value = id;
                document.querySelector("#editUserForm input[name='email']").value = email;
                document.querySelector("#editUserForm input[name='phoneNumber']").value = phoneNumber;
                showEditUserPopup();
            }

            function confirmDelete(userId) {
                if (confirm("Are you sure you want to delete this user?")) {
                    document.getElementById("deleteUserId").value = userId;
                    document.getElementById("deleteForm").submit();
                }
            }

            const searchInput = document.getElementById("searchInput");
            const tableRows = document.querySelectorAll("#userTable tbody tr");

            searchInput.addEventListener("input", function () {
                const searchValue = this.value.toLowerCase();

                tableRows.forEach(function (row) {
                    const firstName = row.cells[1].textContent.toLowerCase();
                    const lastName = row.cells[2].textContent.toLowerCase();
                    const phoneNumber = row.cells[3].textContent.toLowerCase();

                    if (
                        firstName.startsWith(searchValue) ||
                        lastName.startsWith(searchValue) ||
                        phoneNumber.startsWith(searchValue)
                    ) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                });
            });
        </script>
    </body>
</html>
