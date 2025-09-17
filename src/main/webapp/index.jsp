<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>WordSculptor - Home</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .hero {
            text-align: center;
        }
        .btn-purple {
            background-color: #764ba2;
            border: none;
        }
        .btn-purple:hover {
            background-color: #5a3780;
        }
    </style>
</head>
<body>
    <div class="container hero">
        <h1 class="display-3 fw-bold mb-4">
            <i class="fas fa-feather-alt"></i> WordSculptor
        </h1>
        <p class="lead mb-5">
            Transform your text files with powerful analysis tools.<br/>
            Sign up or login to get started.
        </p>
        <div>
            <a href="login.jsp" class="btn btn-purple btn-lg me-3 px-5 py-3 fw-semibold">Login</a>
            <a href="signup.jsp" class="btn btn-outline-light btn-lg px-5 py-3 fw-semibold">Sign Up</a>
        </div>
    </div>

    <!-- Bootstrap Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
