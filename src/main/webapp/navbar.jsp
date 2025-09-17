<%@ page session="true" %>
<%
    String userEmail = (String) session.getAttribute("userEmail");
    String userName = (String) session.getAttribute("userName");

    if (userEmail == null || userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-gradient-primary shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="dashboard.jsp">
      <i class="fas fa-feather-alt"></i> WordSculptor
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="dashboard.jsp"><i class="fas fa-home"></i> Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="analyze.jsp"><i class="fas fa-file-upload"></i> Upload & Analyze</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="profile.jsp"><i class="fas fa-user"></i> Profile</a>
        </li>

        <!-- User info show here -->
        <li class="nav-item">
          <a class="nav-link disabled text-light">
            <i class="fas fa-user-circle"></i> <%= userName %> (<%= userEmail %>)
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link text-danger" href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<style>
  .bg-gradient-primary {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  }
</style>
