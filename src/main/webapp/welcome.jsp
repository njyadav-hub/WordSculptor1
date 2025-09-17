<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome - WordSculptor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-white">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">WordSculptor</a>
        <div class="d-flex">
            <a href="LogoutServlet" class="btn btn-outline-light">Logout</a>
        </div>
    </div>
</nav>

<!-- Welcome message -->
<div class="container mt-5">
    <%
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("login.jsp"); // agar session expire ho gaya ho
            return;
        }
    %>
    <h3 class="text-center">Welcome, <%= username %> 🎉</h3>
    <p class="text-center text-muted">Upload a text file to analyze</p>

    <!-- Upload form -->
    <div class="row justify-content-center mt-4">
        <div class="col-md-6">
            <div class="card p-4 shadow-lg rounded-4">
                <form action="UploadServlet" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label class="form-label">Choose .txt File</label>
                        <input type="file" name="file" class="form-control" accept=".txt" required>
                    </div>
                    <button class="btn btn-primary w-100">Upload & Analyze</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
