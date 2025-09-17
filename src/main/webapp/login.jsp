<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login - WordSculptor</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f8f9fa;
        }
        .card {
            border-radius: 1rem;
        }
        .btn-primary {
            background-color: #764ba2;
            border: none;
        }
        .btn-primary:hover {
            background-color: #5a3780;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-lg p-4">
                <h2 class="text-center text-primary">WordSculptor</h2>
                <p class="text-center text-muted">Login to continue</p>

                <!-- Login Form -->
                <form action="LoginServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label">Username (Email)</label>
                        <input type="text" name="username" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Login</button>
                </form>

                <!-- Signup Link -->
                <div class="text-center mt-3">
                    <p>Don't have an account? <a href="signup.jsp">Sign up</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
