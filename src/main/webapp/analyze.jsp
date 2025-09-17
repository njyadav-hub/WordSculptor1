<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Analyze - WordSculptor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

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
    <!-- <p class="text-center text-muted">Upload a text file to analyze</p>
 -->

<div class="container mt-5">
    <div class="card shadow-lg p-4 rounded-4">
        <h2 class="text-center text-primary">Choose Operations</h2>

        <!-- Form -->
        <form action="AnalyzeServlet" method="post">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="operations" value="removeStopwords">
                <label class="form-check-label">Remove Stopwords</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="operations" value="removeSymbols">
                <label class="form-check-label">Remove Symbols</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="operations" value="uniqueWords">
                <label class="form-check-label">Find Unique Words</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="operations" value="wordCount">
                <label class="form-check-label">Word Count</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="operations" value="alphabetCount">
                <label class="form-check-label">Alphabet Count</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="operations" value="topBottom">
                <label class="form-check-label">Top/Bottom Words & Alphabets</label>
            </div>

            <button class="btn btn-success w-100 mt-3" type="submit">Analyze</button>
        </form>
    </div>

    <!-- JSTL Test Block -->
    <div class="card shadow-lg p-4 rounded-4 mt-4">
       <!--  <h3 class="text-center text-secondary"> Test</h3> -->
        <c:set var="msg" value="✅ JSTL is working with Tomcat 10 & Jakarta EE!" />
        <p class="text-success text-center">
            <c:out value="${msg}" />
        </p>
    </div>
</div>

</body>
</html>
