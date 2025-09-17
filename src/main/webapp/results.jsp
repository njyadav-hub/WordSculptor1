<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<html>
<head>
    <title>Results - WordSculptor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-white">

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
    

<div class="container mt-5">
    <h2 class="text-center text-success">📊 Analysis Results</h2>

    <c:if test="${not empty results}">
        <div class="accordion mt-4" id="resultsAccordion">
            <c:forEach var="entry" items="${results}">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#id${fn:replace(entry.key, ' ', '')}"
                                aria-expanded="false">
                            ${entry.key}
                        </button>
                    </h2>
                    <div id="id${fn:replace(entry.key, ' ', '')}" class="accordion-collapse collapse"
                         data-bs-parent="#resultsAccordion">
                        <div class="accordion-body">

                            <!-- Agar value list hai -->
                            <c:if test="${entry.value ne null and fn:length(entry.value) gt 0}">
                                <ul>
                                    <c:forEach var="item" items="${entry.value}">
                                        <li>${item}</li>
                                    </c:forEach>
                                </ul>
                            </c:if>

                            <!-- Agar simple value hai -->
                            <c:if test="${fn:length(entry.value) eq 0}">
                                ${entry.value}
                            </c:if>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>

    <div class="text-center mt-4">
        <a href="analyze.jsp" class="btn btn-primary">🔄 Try another Operation</a>
    </div>
      <div class="text-center mt-4">
        <a href="upload.jsp" class="btn btn-primary">🔄  Upload New File </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

