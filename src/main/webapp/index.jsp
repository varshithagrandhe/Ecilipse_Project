<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Simple Registration Form</title>
</head>
<body>
    <h2>Registration Form</h2>

    <!-- Handle form submission -->
    <%
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String gender = request.getParameter("gender");
        String country = request.getParameter("country");

        boolean isSubmitted = firstName != null && lastName != null && email != null && password != null && confirmPassword != null && gender != null && country != null;

        if (isSubmitted) {
            if (!password.equals(confirmPassword)) {
                out.println("<p style='color: red;'>Passwords do not match! Please try again.</p>");
            } else {
                out.println("<h3>Registration Successful!</h3>");
                out.println("<p><strong>First Name:</strong> " + firstName + "</p>");
                out.println("<p><strong>Last Name:</strong> " + lastName + "</p>");
                out.println("<p><strong>Email:</strong> " + email + "</p>");
                out.println("<p><strong>Gender:</strong> " + gender + "</p>");
                out.println("<p><strong>Country:</strong> " + country + "</p>");
            }
        }
    %>

    <!-- Display form only if not submitted or if there's an error -->
    <% if (!isSubmitted || !password.equals(confirmPassword)) { %>
    <form method="post">
        <table>
            <tr>
                <td>First Name:</td>
                <td><input type="text" name="firstName" required></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><input type="text" name="lastName" required></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" name="email" required></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td>Confirm Password:</td>
                <td><input type="password" name="confirmPassword" required></td>
            </tr>
             <tr>
                <td>Gender:</td>
                <td>
                    <input type="radio" name="gender" value="Male" required> Male
                    <input type="radio" name="gender" value="Female" required> Female
                </td>
            </tr>
            <tr>
                <td>Country:</td>
                <td>
                    <select name="country" required>
                        <option value="USA">USA</option>
                        <option value="UK">UK</option>
                        <option value="Canada">Canada</option>
                        <option value="India">India</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="Register"></td>
            </tr>
        </table>
    </form>
    <% } %>

</body>
</html>


   


