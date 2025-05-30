<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Report Criteria</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #a8c0ff, #d3e0ff); /* pastel blue gradient */
            min-height: 100vh;
        }

        .top-bar {
            background-color: #7da7ff; /* pastel blue */
            color: #f0f4ff; /* very light pastel */
            padding: 25px 20px;
            text-align: center;
            font-size: 26px;
            font-weight: bold;
            box-shadow: 0 4px 12px rgba(125, 167, 255, 0.6);
        }

        .form-wrapper {
            max-width: 480px;
            margin: 60px auto;
            padding: 35px;
            background-color: #f5f9ff; /* very light pastel blue */
            border-radius: 16px;
            box-shadow: 0 12px 28px rgba(125, 167, 255, 0.3);
        }

        .form-wrapper h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #7da7ff; /* pastel blue */
            font-size: 22px;
        }

        .form-group {
            margin-bottom: 22px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #3a4a6d; /* muted dark blue */
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            font-size: 15px;
            border-radius: 8px;
            border: 1px solid #a3bfff; /* medium pastel blue border */
            outline: none;
            transition: border-color 0.2s;
            background-color: #ffffff;
            color: #204080;
        }

        .form-group input:focus {
            border-color: #7da7ff; /* pastel blue */
            box-shadow: 0 0 6px #7da7ff;
        }

        .submit-btn {
            width: 100%;
            background-color: #7da7ff; /* pastel blue */
            color: #f0f4ff; /* very light pastel */
            padding: 14px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #a3bfff; /* lighter pastel blue */
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 25px;
            color: #7da7ff; /* pastel blue */
            text-decoration: none;
            font-weight: 500;
            font-size: 15px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .form-wrapper {
                margin: 30px 15px;
                padding: 25px;
            }

            .top-bar {
                font-size: 20px;
                padding: 18px;
            }
        }
    </style>
</head>
<body>

    <div class="top-bar">
        Hospital Management System
    </div>

    <div class="form-wrapper">
        <h2>Generate Report</h2>
        <%
            String reportType = (String) request.getAttribute("reportType");
        %>
        <form action="ReportServlet" method="post">
            <input type="hidden" name="reportType" value="<%= reportType %>">

            <% if ("dateRange".equals(reportType)) { %>
                <div class="form-group">
                    <label for="startDate">Start Date</label>
                    <input type="date" id="startDate" name="startDate" required>
                </div>
                <div class="form-group">
                    <label for="endDate">End Date</label>
                    <input type="date" id="endDate" name="endDate" required>
                </div>
            <% } else if ("ailment".equals(reportType)) { %>
                <div class="form-group">
                    <label for="ailment">Ailment</label>
                    <input type="text" id="ailment" name="ailment" placeholder="Enter ailment (e.g., Fever)" required>
                </div>
            <% } else if ("doctor".equals(reportType)) { %>
                <div class="form-group">
                    <label for="doctor">Doctor Name</label>
                    <input type="text" id="doctor" name="doctor" placeholder="Enter doctor's name" required>
                </div>
            <% } %>

            <button type="submit" class="submit-btn">Generate Report</button>
        </form>

        <a class="back-link" href="reports.jsp">← Back to Reports</a>
    </div>
</body>
</html>
