<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload Text File</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center text-primary">📂 Upload a Text File</h2>

    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg p-4 rounded-4">
                <form action="${pageContext.request.contextPath}/UploadServlet"
                      method="post"
                      enctype="multipart/form-data">

                    <div class="mb-3">
                        <label class="form-label">Choose .txt File</label>
                        <input type="file" name="file" accept=".txt" class="form-control" required>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Upload & Analyze</button>
                </form>

                <!-- Success message -->
                <c:if test="${not empty message}">
                    <div class="alert alert-success mt-3">
                        ${message}
                    </div>
                </c:if>

                <!-- Error message -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger mt-3">
                        ${error}
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
