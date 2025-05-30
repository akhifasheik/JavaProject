<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital Management System</title>
    <style>
        :root {
            --primary-blue: #005f99;       /* deep royal blue */
            --accent-teal: #008cba;        /* vivid medium blue */
            --hover-teal: #0077a3;         /* slightly darker medium blue */
            --bg-soft: #e6f0fa;            /* very light blue background */
            --white: #ffffff;
            --text-dark: #1b2a47;          /* dark navy for text */
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: var(--bg-soft);
            color: var(--text-dark);
            height: 100%;
        }

        .navbar {
            background: var(--primary-blue);
            color: var(--white);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .navbar h2 {
            font-size: 1.8em;
        }

        .nav-links {
            display: flex;
            gap: 18px;
        }

        .nav-links a {
            background: var(--accent-teal);
            color: var(--white);
            padding: 10px 16px;
            text-decoration: none;
            border-radius: 8px;
            transition: background 0.3s ease;
            font-weight: 600;
        }

        .nav-links a:hover {
            background: var(--hover-teal);
        }

        .main {
            padding: 40px;
        }

        .header {
            background-color: var(--primary-blue);
            color: var(--white);
            padding: 25px 30px;
            border-radius: 16px;
            margin-bottom: 40px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.15);
        }

        .header h1 {
            font-size: 2.2em;
            margin-bottom: 10px;
        }

        .header p {
            font-size: 1.1em;
        }

        .dashboard {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: space-around;
        }

        .card {
            background: var(--white);
            border-radius: 14px;
            padding: 30px;
            flex: 1 1 280px;
            min-width: 280px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.2);
        }

        .card h3 {
            color: var(--primary-blue);
            margin-bottom: 15px;
        }

        .card p {
            color: #4a4a4a;
        }

        .footer {
            margin-top: 60px;
            text-align: center;
            color: var(--white);
            background: linear-gradient(to right, var(--accent-teal), var(--hover-teal));
            padding: 18px;
            border-radius: 12px;
            font-size: 0.95em;
        }

        @media (max-width: 768px) {
            .nav-links {
                flex-direction: column;
                align-items: flex-start;
            }

            .navbar {
                flex-direction: column;
                align-items: flex-start;
            }

            .main {
                padding: 20px;
            }

            .header h1 {
                font-size: 1.6em;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <h2>HMS Dashboard</h2>
        <div class="nav-links">
            <a href="patientadd.jsp">➕ Add</a>
            <a href="patientupdate.jsp">✏️ Update</a>
            <a href="patientdelete.jsp">🗑️ Delete</a>
            <a href="DisplayPatientsServlet">📋 View</a>
            <a href="reports.jsp">📊 Reports</a>
        </div>
    </div>

    <div class="main">
        <div class="header">
            <h1>Hospital Management System</h1>
            <p>Your health, our priority – streamlined with care.</p>
        </div>

        <div class="dashboard">
            <div class="card">
                <h3>Patient Management</h3>
                <p>Track, edit, and manage patient information effectively.</p>
            </div>
            <div class="card">
                <h3>Doctor Assignments</h3>
                <p>Ensure optimal care by managing doctor-patient connections.</p>
            </div>
            <div class="card">
                <h3>Reports & Analytics</h3>
                <p>Access visual data insights for better decision-making.</p>
            </div>
        </div>

        <div class="footer">
            © 2025 Hospital Management System. All rights reserved.
        </div>
    </div>

</body>
</html>
