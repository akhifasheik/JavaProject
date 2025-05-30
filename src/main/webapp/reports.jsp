<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Generate Reports</title>
<style>
    :root {
        --bg: #f0f7f9;                /* very light blue */
        --primary: #028090;           /* deep teal-blue */
        --accent: #05668d;            /* darker teal */
        --secondary: #00a896;         /* bright teal */
        --card-bg: #ffffff;
        --text-primary: #034c61;      /* dark blue */
        --text-secondary: #4a6fa5;    /* medium blue */
        --hover-bg: #d0e8f2;          /* light teal-blue hover */
        --border-color: #a9c5d3;      /* soft blue-grey */
    }

    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: var(--bg);
        color: var(--text-primary);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .header {
        background: linear-gradient(90deg, var(--primary), var(--secondary));
        width: 100%;
        padding: 30px 20px;
        text-align: center;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        color: #fff;
        border-bottom-left-radius: 24px;
        border-bottom-right-radius: 24px;
    }

    .header h1 {
        margin: 0;
        font-weight: 700;
        font-size: 2.4rem;
        color: #e0f7fa;
    }

    .header p {
        margin: 8px 0 0;
        font-size: 1.1rem;
        font-weight: 500;
        color: #b2dfdb;
    }

    .container {
        max-width: 1080px;
        width: 95%;
        margin: 40px auto 60px;
        padding: 30px 40px;
        background: var(--card-bg);
        border-radius: 20px;
        box-shadow: 0 6px 20px rgba(2, 128, 144, 0.3);
    }

    .container h2 {
        text-align: center;
        color: var(--primary);
        font-weight: 700;
        margin-bottom: 40px;
        font-size: 2rem;
    }

    .report-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
        gap: 28px;
    }

    .report-card {
        background: var(--bg);
        border: 2px solid var(--border-color);
        border-radius: 16px;
        padding: 24px 28px;
        box-shadow: 0 4px 12px rgba(5, 102, 141, 0.3);
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
        cursor: pointer;
    }

    .report-card:hover {
        background-color: var(--hover-bg);
        box-shadow: 0 8px 20px rgba(5, 102, 141, 0.6);
    }

    .report-card h3 {
        color: var(--accent);
        margin-top: 0;
        font-weight: 700;
        font-size: 1.3rem;
    }

    .report-card p {
        margin: 18px 0 24px;
        font-size: 1rem;
        line-height: 1.5;
        color: var(--text-secondary);
    }

    .report-link {
        display: inline-block;
        background-color: var(--primary);
        color: #e0f7fa;
        font-weight: 600;
        padding: 12px 22px;
        border-radius: 10px;
        text-decoration: none;
        font-size: 1rem;
        box-shadow: 0 6px 15px rgba(2, 128, 144, 0.7);
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }

    .report-link:hover {
        background-color: var(--secondary);
        box-shadow: 0 8px 22px rgba(0, 168, 150, 0.8);
        color: #004d40;
    }

    .back-link {
        display: block;
        text-align: center;
        margin-top: 40px;
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--primary);
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .back-link:hover {
        color: var(--accent);
        text-decoration: underline;
    }

    @media (max-width: 600px) {
        .report-card {
            padding: 18px 20px;
        }

        .report-link {
            width: 100%;
            text-align: center;
        }
    }
</style>
</head>
<body>

    <div class="header">
        <h1>Hospital Management System</h1>
        <p>Report Generation Dashboard</p>
    </div>

    <div class="container">
        <h2>Select a Report to Generate</h2>

        <div class="report-grid">
            <div class="report-card">
                <h3>Patients Admitted in Date Range</h3>
                <p>Get a report of all patients admitted between specific dates for statistical and operational review.</p>
                <a href="ReportCriteriaServlet?reportType=dateRange" class="report-link">Generate Report</a>
            </div>

            <div class="report-card">
                <h3>Patients with Specific Ailment</h3>
                <p>Filter and view patients diagnosed with a particular ailment or health condition.</p>
                <a href="ReportCriteriaServlet?reportType=ailment" class="report-link">Generate Report</a>
            </div>

            <div class="report-card">
                <h3>Patients Assigned to Specific Doctor</h3>
                <p>Generate a summary of patients under the care of a chosen doctor for review or audits.</p>
                <a href="ReportCriteriaServlet?reportType=doctor" class="report-link">Generate Report</a>
            </div>
        </div>

        <a href="index.jsp" class="back-link">← Back to Home</a>
    </div>

</body>
</html>
