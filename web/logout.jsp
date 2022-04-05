<%-- 
    Document   : logout
    Created on : Feb 19, 2022, 12:06:15 PM
    Author     : oracle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
   session.invalidate();
   
   
   response.sendRedirect("login.jsp");
 %>
