<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Patient</title>
    <style>
        :root {
            --deep-blue: #3949ab;
            --light-purple: #e8eaf6;
            --accent-purple: #7e57c2;
            --dark-purple: #5e35b1;
            --white: #ffffff;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e3f2fd, var(--light-purple));
            color: #212121;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        .header {
            background-color: var(--deep-blue);
            color: white;
            padding: 30px 0;
            width: 100%;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .header h1 {
            font-size: 2em;
            margin-bottom: 8px;
        }

        .form-wrapper {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(6px);
            margin: 40px auto;
            padding: 40px;
            border-radius: 15px;
            max-width: 600px;
            width: 90%;
            box-shadow: 0 12px 30px rgba(0,0,0,0.1);
        }

        .form-wrapper h2 {
            text-align: center;
            margin-bottom: 25px;
            color: var(--accent-purple);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-size: 0.95em;
            color: #333;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px;
            font-size: 1em;
            border-radius: 8px;
            border: 1px solid #ccc;
            background-color: var(--white);
            transition: border-color 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: var(--accent-purple);
            outline: none;
        }

        .submit-btn {
            width: 100%;
            padding: 14px;
            font-size: 1.1em;
            background-color: var(--accent-purple);
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: var(--dark-purple);
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: var(--deep-blue);
            text-decoration: none;
            font-weight: bold;
            transition: color 0.2s ease;
        }

        .back-link a:hover {
            color: var(--accent-purple);
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .form-wrapper {
                padding: 30px 20px;
            }

            .header h1 {
                font-size: 1.5em;
            }

            .form-wrapper h2 {
                font-size: 1.3em;
            }
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Update Patient</h1>
        <p>Modify existing patient record</p>
    </div>

    <div class="form-wrapper">
        <h2>Edit Patient Details</h2>
        <form action="UpdatePatientServlet" method="post">
            <div class="form-group">
                <label for="id">Patient ID</label>
                <input type="number" id="id" name="id" required>
            </div>

            <div class="form-group">
                <label for="name">Patient Name</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="age">Age</label>
                <input type="number" id="age" name="age" required>
            </div>

            <div class="form-group">
                <label for="gender">Gender</label>
                <select name="gender" id="gender" required>
                    <option value="">-- Select Gender --</option>
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                </select>
            </div>

            <div class="form-group">
                <label for="admissionDate">Admission Date</label>
                <input type="date" id="admissionDate" name="admissionDate" required>
            </div>

            <div class="form-group">
                <label for="ailment">Ailment</label>
                <input type="text" id="ailment" name="ailment" required>
            </div>

            <div class="form-group">
                <label for="doctor">Assigned Doctor</label>
                <input type="text" id="doctor" name="doctor" required>
            </div>

            <input type="submit" class="submit-btn" value="Update Patient">
        </form>

        <div class="back-link">
            <a href="index.jsp">&larr; Back to Home</a>
        </div>
    </div>

</body>
</html>
