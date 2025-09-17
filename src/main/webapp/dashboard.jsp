<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%
    String user = (String) session.getAttribute("userEmail");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard - WordSculptor</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        .text-purple { color: #764ba2; }
        body { background-color: #f8f9fa; }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4 text-primary">Welcome, <%= user %>!</h1>

    <div class="row g-4">
        <!-- Upload -->
        <div class="col-md-4">
            <div class="card shadow-sm border-0 h-100">
                <div class="card-body text-center">
                    <i class="fas fa-file-upload fa-3x text-purple mb-3"></i>
                    <h5 class="card-title">Upload Text File</h5>
                    <p class="card-text">Upload your .txt files for analysis.</p>
                    <a href="analyze.jsp" class="btn btn-primary">Upload Now</a>
                </div>
            </div>
        </div>

        <!-- History -->
        <div class="col-md-4">
            <div class="card shadow-sm border-0 h-100">
                <div class="card-body text-center">
                    <i class="fas fa-chart-pie fa-3x text-purple mb-3"></i>
                    <h5 class="card-title">View Analysis</h5>
                    <p class="card-text">Check your previous analysis results.</p>
                    <a href="history.jsp" class="btn btn-primary disabled" title="Coming Soon">View History</a>
                </div>
            </div>
        </div>

        <!-- Profile -->
        <div class="col-md-4">
            <div class="card shadow-sm border-0 h-100">
                <div class="card-body text-center">
                    <i class="fas fa-cogs fa-3x text-purple mb-3"></i>
                    <h5 class="card-title">Settings</h5>
                    <p class="card-text">Manage your profile and preferences.</p>
                    <a href="profile.jsp" class="btn btn-primary">Go to Profile</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
