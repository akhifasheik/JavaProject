<%@ page import="java.util.*, com.model.Patient" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Patients</title>
    <style>
        :root {
            --primary-teal: #80cbc4;
            --dark-teal: #004d40;
            --light-mint: #e0f2f1;
            --table-header: #4db6ac;
            --white: #ffffff;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: var(--light-mint);
            margin: 0;
            padding: 0;
        }

        .header {
            background: linear-gradient(90deg, var(--primary-teal), var(--dark-teal));
            padding: 30px 0;
            color: white;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .header h1 {
            margin: 0;
            font-size: 2em;
        }

        table {
            width: 90%;
            margin: 40px auto;
            border-collapse: collapse;
            border-radius: 15px;
            overflow: hidden;
            background-color: var(--white);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 14px 16px;
            text-align: center;
            font-size: 0.95em;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: var(--table-header);
            color: white;
            font-size: 1em;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #e0f7fa;
        }

        .back-link {
            text-align: center;
            margin: 30px 0;
        }

        .back-link a {
            text-decoration: none;
            color: var(--dark-teal);
            font-weight: bold;
            font-size: 1em;
            transition: color 0.3s ease;
        }

        .back-link a:hover {
            color: #00796b;
        }

        @media (max-width: 768px) {
            table {
                width: 95%;
            }

            th, td {
                padding: 10px;
                font-size: 0.9em;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>All Patients</h1>
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
            List<Patient> patients = (List<Patient>) request.getAttribute("listPatient");
            if (patients != null) {
                for (Patient p : patients) {
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
            }
        %>
    </table>

    <div class="back-link">
        <a href="index.jsp">&larr; Back to Home</a>
    </div>
</body>
</html>
