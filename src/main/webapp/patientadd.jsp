<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Patient</title>
    <style>
        :root {
            --primary-blue: #005f99;       /* deep royal blue */
            --accent-teal: #008cba;        /* vivid medium blue */
            --hover-teal: #0077a3;         /* slightly darker medium blue */
            --bg-soft: #e6f0fa;            /* very light blue background */
            --white: #ffffff;
            --text-dark: #1b2a47;          /* dark navy for text */
            --input-border: #a0c4db;
            --input-focus: #0077a3;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: var(--bg-soft);
            color: var(--text-dark);
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 40px 20px;
        }

        .header {
            background-color: var(--primary-blue);
            color: var(--white);
            padding: 30px 20px;
            width: 100%;
            max-width: 900px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0, 95, 153, 0.3);
            margin-bottom: 40px;
        }

        .header h1 {
            font-size: 2.4em;
            margin-bottom: 8px;
        }

        .header p {
            font-size: 1.1em;
            font-weight: 500;
            letter-spacing: 0.02em;
        }

        .form-wrapper {
            background: var(--white);
            padding: 40px 35px;
            border-radius: 20px;
            max-width: 900px;
            width: 100%;
            box-shadow: 0 10px 30px rgba(0, 95, 153, 0.12);
        }

        .form-wrapper h2 {
            color: var(--accent-teal);
            font-size: 2em;
            text-align: center;
            margin-bottom: 35px;
            font-weight: 700;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 28px 30px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            margin-bottom: 8px;
            font-size: 1em;
            color: var(--text-dark);
            font-weight: 600;
            letter-spacing: 0.02em;
        }

        .form-group input,
        .form-group select {
            padding: 14px 14px;
            border: 2px solid var(--input-border);
            border-radius: 12px;
            font-size: 1em;
            font-weight: 500;
            color: var(--text-dark);
            background: var(--white);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-group input::placeholder,
        .form-group select::placeholder {
            color: #9bb7cc;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: var(--input-focus);
            box-shadow: 0 0 8px var(--input-focus);
            outline: none;
        }

        .submit-btn {
            margin-top: 40px;
            width: 100%;
            padding: 16px;
            font-size: 1.2em;
            font-weight: 700;
            color: var(--white);
            background-color: var(--accent-teal);
            border: none;
            border-radius: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 140, 186, 0.4);
        }

        .submit-btn:hover {
            background-color: var(--hover-teal);
            box-shadow: 0 7px 22px rgba(0, 119, 163, 0.6);
        }

        .back-link {
            margin-top: 28px;
            text-align: center;
        }

        .back-link a {
            font-weight: 600;
            color: var(--accent-teal);
            text-decoration: none;
            font-size: 1.05em;
            transition: color 0.2s ease;
        }

        .back-link a:hover {
            color: var(--hover-teal);
            text-decoration: underline;
        }

        @media (max-width: 720px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Add New Patient</h1>
        <p>Fill the form below to register a new patient</p>
    </div>

    <div class="form-wrapper">
        <h2>Patient Registration</h2>
        <form action="AddPatientServlet" method="post">
            <div class="form-grid">
                <div class="form-group">
                    <label for="name">Patient Name</label>
                    <input type="text" id="name" name="name" required placeholder="Enter patient's full name">
                </div>

                <div class="form-group">
                    <label for="age">Age</label>
                    <input type="number" id="age" name="age" required placeholder="Enter patient's age">
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender" required>
                        <option value="" disabled selected>-- Select Gender --</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="admissionDate">Admission Date</label>
                    <input type="date" id="admissionDate" name="admissionDate" required>
                </div>

                <div class="form-group">
                    <label for="ailment">Ailment/Condition</label>
                    <input type="text" id="ailment" name="ailment" required placeholder="Describe patient's ailment">
                </div>

                <div class="form-group">
                    <label for="doctor">Assigned Doctor</label>
                    <input type="text" id="doctor" name="doctor" required placeholder="Enter doctor's name">
                </div>
            </div>

            <input type="submit" class="submit-btn" value="Add Patient">
        </form>

        <div class="back-link">
            <a href="index.jsp">&larr; Back to Home</a>
        </div>
    </div>

</body>
</html>
