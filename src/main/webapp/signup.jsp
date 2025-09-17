<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Signup - WordSculptor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-lg p-4 rounded-4">
                <h2 class="text-center text-success">WordSculptor</h2>
                <p class="text-center text-muted">Create an account</p>

                <form action="SignupServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label">First Name</label>
                        <input type="text" name="firstName" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Last Name</label>
                        <input type="text" name="lastName" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input type="tel" name="phoneNumber" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Confirm Password</label>
                        <input type="password" name="confirmPassword" class="form-control" required>
                    </div>
                    
                    <button class="btn btn-success w-100">Sign Up</button>
                </form>

                <div class="text-center mt-3">
                    <p>Already have an account? <a href="login.jsp">Login</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
