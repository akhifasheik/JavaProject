<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Delete Patient</title>
<style>
    /* Colors */
    :root {
        --teal-light: #a0e7e5;
        --teal: #00b4c4;
        --teal-dark: #007a87;
        --coral: #ff6f61;
        --coral-dark: #e55349;
        --background: #f9f9f9;
        --white: #ffffff;
        --shadow: rgba(0, 0, 0, 0.1);
    }

    /* Reset */
    *, *::before, *::after {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: var(--background);
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
    }

    /* Header */
    .header {
        background: linear-gradient(135deg, var(--teal), var(--teal-dark));
        color: var(--white);
        padding: 40px 20px;
        width: 100%;
        max-width: 500px;
        border-radius: 16px 16px 0 0;
        box-shadow: 0 8px 20px var(--shadow);
        text-align: center;
    }
    .header h1 {
        margin-bottom: 8px;
        font-size: 2.2rem;
        letter-spacing: 1.2px;
    }
    .header p {
        font-weight: 500;
        font-size: 1.1rem;
        opacity: 0.85;
    }

    /* Form container */
    .form-container {
        background: var(--white);
        width: 100%;
        max-width: 500px;
        border-radius: 0 0 16px 16px;
        padding: 40px 30px 50px;
        box-shadow: 0 8px 24px var(--shadow);
        display: flex;
        flex-direction: column;
        gap: 30px;
    }

    .form-container h2 {
        color: var(--teal-dark);
        margin: 0;
        font-size: 1.8rem;
        text-align: center;
        letter-spacing: 0.8px;
    }

    /* Form styling */
    form {
        display: flex;
        flex-direction: column;
        gap: 25px;
    }

    label {
        font-weight: 600;
        font-size: 1rem;
        color: #333;
        margin-bottom: 8px;
        user-select: none;
    }

    input[type="number"] {
        padding: 15px 18px;
        font-size: 1rem;
        border: 2px solid var(--teal-light);
        border-radius: 12px;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }
    input[type="number"]::placeholder {
        color: #bbb;
        font-style: italic;
    }
    input[type="number"]:focus {
        outline: none;
        border-color: var(--coral);
        box-shadow: 0 0 8px var(--coral);
    }

    /* Submit button */
    .submit-btn {
        background-color: var(--coral);
        border: none;
        color: var(--white);
        font-size: 1.2rem;
        padding: 16px 0;
        border-radius: 14px;
        cursor: pointer;
        font-weight: 700;
        letter-spacing: 1px;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
        box-shadow: 0 6px 15px rgba(255, 111, 97, 0.5);
    }
    .submit-btn:hover,
    .submit-btn:focus {
        background-color: var(--coral-dark);
        box-shadow: 0 8px 22px rgba(229, 83, 73, 0.7);
        outline: none;
    }

    /* Back link */
    .back-link {
        text-align: center;
        margin-top: 10px;
    }
    .back-link a {
        text-decoration: none;
        color: var(--teal-dark);
        font-weight: 600;
        font-size: 1rem;
        transition: color 0.25s ease;
    }
    .back-link a:hover {
        color: var(--coral);
        text-decoration: underline;
    }

    /* Responsive */
    @media (max-width: 480px) {
        .header, .form-container {
            border-radius: 12px;
            padding: 30px 20px;
        }
        .header h1 {
            font-size: 1.8rem;
        }
        .form-container h2 {
            font-size: 1.5rem;
        }
        .submit-btn {
            font-size: 1rem;
            padding: 14px 0;
        }
    }
</style>
</head>
<body>

    <div class="header">
        <h1>Delete Patient Record</h1>
        <p>Remove a patient safely and efficiently</p>
    </div>

    <div class="form-container">
        <h2>Enter Patient ID</h2>
        <form action="DeletePatientServlet" method="post" autocomplete="off" novalidate>
            <label for="id">Patient ID</label>
            <input type="number" id="id" name="id" placeholder="Enter Patient ID" min="1" required />
            <button type="submit" class="submit-btn">Delete Patient</button>
        </form>
        <div class="back-link">
            <a href="index.jsp">&larr; Back to Home</a>
        </div>
    </div>

</body>
</html>
