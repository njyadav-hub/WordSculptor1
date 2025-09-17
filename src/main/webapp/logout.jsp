<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%
    if (session != null) {
        session.invalidate();   // सभी session attributes हटेंगे
    }
    response.sendRedirect("login.jsp");
%>
