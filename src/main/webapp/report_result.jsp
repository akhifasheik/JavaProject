<%@ page import="java.util.*, com.model.Patient" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Report Results</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #a8c0ff, #d3e0ff); /* soft pastel blue gradient */
            min-height: 100vh;
        }

        .header {
            background-color: #7da7ff; /* pastel blue */
            padding: 25px 0;
            color: #f0f4ff; /* very light pastel */
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            box-shadow: 0 4px 12px rgba(125, 167, 255, 0.6);
        }

        table {
            width: 95%;
            margin: 40px auto;
            border-collapse: collapse;
            background: #f5f9ff; /* very light pastel blue */
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 12px 24px rgba(125, 167, 255, 0.3);
        }

        th {
            background-color: #a3bfff; /* medium pastel blue */
            color: #204080; /* darker blue text */
            padding: 14px;
            font-size: 16px;
        }

        td {
            padding: 12px 16px;
            text-align: center;
            font-size: 15px;
            color: #3a4a6d; /* muted dark blue */
            border-bottom: 1px solid #d0dafb;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover {
            background-color: #c9d9ff; /* lighter pastel blue hover */
            transition: background-color 0.3s ease;
        }

        .no-data {
            text-align: center;
            padding: 40px;
            font-size: 18px;
            color: #7b9cff; /* pastel blue text */
        }

        .back-link {
            text-align: center;
            margin: 30px 0;
        }

        .back-link a {
            text-decoration: none;
            color: #7da7ff; /* pastel blue */
            font-weight: bold;
            font-size: 16px;
            transition: color 0.3s;
        }

        .back-link a:hover {
            color: #a3bfff; /* lighter pastel blue */
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            th, td {
                padding: 10px;
                font-size: 14px;
            }

            .header {
                font-size: 22px;
                padding: 18px 0;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        Report Results
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Admission Date</th>
            <th>Ailment</th>
            <th>Doctor</th>
        </tr>
        <%
            List<Patient> result = (List<Patient>) request.getAttribute("listPatient");
            if (result != null && !result.isEmpty()) {
                for (Patient p : result) {
        %>
        <tr>
            <td><%= p.getPatientID() %></td>
            <td><%= p.getPatientName() %></td>
            <td><%= p.getAge() %></td>
            <td><%= p.getGender() %></td>
            <td><%= p.getAdmissionDate() %></td>
            <td><%= p.getAilment() %></td>
            <td><%= p.getAssignedDoctor() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="7" class="no-data">No data found for the selected criteria.</td>
        </tr>
        <% } %>
    </table>

    <div class="back-link">
        <a href="reports.jsp">&larr; Back to Reports</a>
    </div>
</body>
</html>
